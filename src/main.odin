
package main

import "core:fmt"
import "core:os"

import "shared:flag"

main :: proc() {

    test_flags := flag.app{ 
        app_flags = {
		    {name = "hello", usage = "Given a string", value = "", default_value = "Hello, World!"},
		    {name = "test", usage = "Given a int", value = "", default_value = "12345"},
        },
    }

	flags, ok := flag.app_create(test_flags)

    if !ok {
        fmt.eprintln("Error: Failed to create app")
        return
    }
}
