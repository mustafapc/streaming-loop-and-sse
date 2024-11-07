{application, 'cowboy2', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['cowboy2_app','cowboy2_sup']},
	{registered, [cowboy2_sup]},
	{applications, [kernel,stdlib]},
	{optional_applications, []},
	{mod, {cowboy2_app, []}},
	{env, []}
]}.