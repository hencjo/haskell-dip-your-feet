with import <nixpkgs> {}; {
	env = stdenv.mkDerivation {
		name = "fp-patterns";
                shellHook = ''source ~/applications/git-bash-prompt-utils/git-bash-prompt-extras.sh
PS1='`if [ $? = 0 ]; then echo "\[\e[32m\] ✔ "; else echo "\[\e[31m\] ✘ "; fi`\[\e[01;37m\] $name:`[[ $(git status 2> /dev/null | head -n2 | tail -n1) != "# Changes to be committed:" ]] && echo "\[\e[31m\]" || echo "\[\e[33m\]"``[[ $(git status -s 2> /dev/null | tail -n1) != "" ]] || echo "\[\e[32m\]"`$(__git_ps1 " %s\[\e[00m\] ")\[\e[01;34m\]`__git_relative_subdir`\[\e[00m\] \$ '
TERM=xterm-256color'';
		buildInputs = [ 
			stdenv
			git
                        mdp
                        stack
		];
	};
}
