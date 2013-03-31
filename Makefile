COFFEE = $(shell find src -name "*.coffee" -type f)
JS = $(COFFEE:src/%.coffee=lib/%.js)

STYL = $(shell find src -name "*.styl" -type f)
CSS = $(STYL:src/%.styl=lib/%.css)

TEST_COFFEE = $(shell find test/src -name "*.coffee" -type f)
TEST_JS = $(TEST_COFFEE:test/src/%.coffee=test/lib/%.js)

# test: build test/lib $(TEST_JS) test/support/index.html
# 	@mocha-phantomjs -R dot test/support/index.html

build: node_modules components lib $(JS) $(CSS)
	@component build --dev

node_modules:
	@npm install

test/lib:
	@mkdir -p test/lib

components:
	@component install --dev

lib:
	@mkdir -p lib

lib/%.js: src/%.coffee
	coffee -bcj $@ $<

lib/style.css: src/style.styl
	stylus -u nib --compress < $< > $@

test/lib/%.js: test/src/%.coffee
	coffee -bcj $@ $<

test/support/index.html: test/support/index.jade
	jade < $< --path $< > $@

clean:
	@rm -rf lib build test/lib test/support/index.html

example: build
	@coffee example

.PHONY: clean test example