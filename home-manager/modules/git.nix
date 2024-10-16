{
  programs.git = {
		enable = true;
		userName = "jank5";
		userEmail = "klevzhic5jank@gmail.com";
 };
  aliases = {
 		a = "add";
 		c = "commit";
 		ca = "commit -a";
 		f = "fetch";
 		cl = "clone";
 		d = "diff";
 		ps = "push";
 		st = "status";
 		lol = "log --graph --decorate --pretty=oneline --abbrev-commit";
		lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
 	};
 	safe = {
 	directory = "*"
 	};
}

