{ config , lib, ...} : {
  security.doas.enable = true;
  security.sudo.enable = true;
  security.doas.extraRules = [{
        users = ["zemo"];
        keepEnv = false;
        persist = true;
  }];
}
