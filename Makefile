cidata/user-data: cidata/user-data.template .ssh/ssh-container
	@cat "$<" | env CONTAINER_SSH_KEY="$(shell cat .ssh/ssh-container.pub)" envsubst '$$USER $$CONTAINER_SSH_KEY' | tee "$@.tmp"
	mv "$@.tmp" "$@"

.ssh/ssh-container:
	@mkdir -p $(shell dirname $@)
	@ssh-keygen -f $@ -P ''
