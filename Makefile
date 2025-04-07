RUBY_IMAGE=ruby:3.4

run:
	docker run --rm -it -v $(PWD):/app -w /app $(RUBY_IMAGE) ruby $(FILE)
irb:
	docker run --rm -it -v $(PWD):/app -w /app $(RUBY_IMAGE) irb