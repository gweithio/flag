package flag

import "core:fmt"
import "core:os"
import "core:strings"

// Our flag struct
@(private)
flags :: struct {
	name:          string,
	usage:         string,
	value:         string,
	default_value: string,
}

app :: struct {
	app_flags: [dynamic]flags,
}

app_create :: proc(using self: app) -> (map[string]string, bool) {
	app_created := false
	data, ok := flag_create(self.app_flags)
	ok = flag_parse(self.app_flags)

	if ok {
		return data, ok
	}

	return data, app_created
}

// Create our flags and return a map
@(private)
flag_create :: proc(self: [dynamic]flags) -> (map[string]string, bool) {

	flag_map := make(map[string]string)

	for f in self {
		value := ""

		if f.value == "" {
			value = f.default_value
		}

		flag_map[f.name] = value
	}

	return flag_map, true
}

// Parse our flags
@(private)
flag_parse :: proc(self: [dynamic]flags) -> bool {
	args := os.args[1:]
	if len(args) <= 0 {
		fmt.println("USAGE:")
		for f in self {
			fmt.println("\nCommand:", strings.concatenate(
					[]string{"-", strings.to_lower(f.name), ":string"},
				), "\nUsage:", f.usage, "\nDefault:", f.default_value)
		}
	}

	return true
}
