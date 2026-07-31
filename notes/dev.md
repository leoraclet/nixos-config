# Developement Environment

> [!NOTE]
>
> I mainly code in Python, C / C++, Typescript / Javascript and some basic HTML, CSS, but I would
> like to learn and use Go.
>
> I also regularly use Markdown and Latex for documents editing.

To set up my different developement environments, I use `flake.nix` with those great
[templates](https://github.com/the-nix-way/dev-templates/) as a starting point,
that I then extend to my needs.

It provides a local, consistent and reproducible environment for each project in
every programming / scripting language, and I find it the most practical way t
get things done.

> [!IMPORTANT]
>
> It works particularly well for C / C++ projects where I need to use libraries
> like SFML, SDL or Dear ImGUI, because it would be a **PAIN** to setup otherwise.

I also use [direnv](https://direnv.net/) to automatically load the developement
environement in the shell when I'm in the directory (do `direnv allow` in the project
directory to make it happen).

> [!TIP]
>
> There are also the [devenv](https://devenv.sh/) and [devbox](https://www.jetify.com/devbox)
> projects that are even simplier to work with and configure when beginning.
