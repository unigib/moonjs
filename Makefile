EMCC=emcc

# We tell Emscripten to dynamically export all symbols natively, bypassing the strict compile-time checks
agc.js: main.c agc_engine.c
	$(EMCC) *.c -O2 -o agc.js \
		-s WASM=0 \
		-s EXPORTED_RUNTIME_METHODS="['cwrap','ccall']" \
		-s LINKABLE=1 \
		-s EXPORT_ALL=1 \
		-Wl,--export-dynamic \
		--preload-file Core.bin

clean:
	rm -f agc.js agc.data agc.wasm *.o
