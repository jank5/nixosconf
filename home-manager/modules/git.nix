{
  programs.git = {
		enable = true;
		userName = "jank5";
		userEmail = "klevzhic5jank@gmail.com";
		extraConfig = {
		  safe.directory = "/home/zemo/nixosconf/.git";
		};
		includes = [
			{ path = "/home/zemo/nixosconf/home-manager/modules/gitalias.txt"; }
		];
 };
}

