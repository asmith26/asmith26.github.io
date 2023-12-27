env-create:
	mamba env create

install-ruby-dependencies:
	bundle

run-local-server:
	bundle exec jekyll s
