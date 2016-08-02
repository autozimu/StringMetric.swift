all: build

build:
	swift build

test: build
	swift test

docs:
	swift package generate-xcodeproj
	jazzy --clean \
		--author "Junfeng (Jeff) Li" \
		--author_url https://github.com/autozimu \
		--github_url https://github.com/autozimu/StringMetric.swift \
		--github-file-prefix https://github.com/autozimu/StringMetric.swift/blob/master

gh-pages: docs
	ghp-import -n -p $^

clean:
	swift build --clean
	rm docs

.PHONY: build test docs gh-pages clean
