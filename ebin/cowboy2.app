{application, 'cowboy2', [
	{description, ""},
	{vsn, "rolling"},
	{modules, ['cowboy2_app','cowboy2_sup','html_handler','sse_handler','stream_handler']},
	{registered, [cowboy2_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{optional_applications, []},
	{mod, {cowboy2_app, []}},
	{env, []}
]}.