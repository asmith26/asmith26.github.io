help:                                        ## Show help docs
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)

env-create:                                  ## Create mamba env
	mamba env create -f environment-from_history.yml

env-create-from-lock:                        ## Create mamba env (via lock)
	mamba env create -f environment.yml

env-export:                                  ## Export mamba env
	mamba env export > environment.yml
	mamba env export --from-history > environment-from_history.yml

install-ruby-dependencies:                   ## Install ruby dependencies
	bundle

run-local-server:                            ## Run a local server
	bundle exec jekyll s
