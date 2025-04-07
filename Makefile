RUBY_IMAGE=ruby:3.4

run:
	docker run --rm -v $(PWD):/app -w /app $(RUBY_IMAGE) ruby $(FILE)