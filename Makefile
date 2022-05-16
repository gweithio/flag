.PHONY: test
default: run

run: 
	odin run src/*.odin -file -out:flag.exe -warnings-as-errors -collection:shared=src --

test: 
	odin test tests -warnings-as-errors -show-timings -collection:shared=src

build: 
	odin build src -o:speed -out:flag.exe -collection:shared=src

clean:
	rm tests/.bin
	rm src/.bin
	rm flag
