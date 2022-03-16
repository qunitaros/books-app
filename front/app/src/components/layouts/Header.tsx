import React, { useContext } from "react";
import { useHistory, Link } from "react-router-dom";
import Cookies from "js-cookie";

import { styled } from "@mui/material/styles";

import AppBar from "@mui/material/AppBar";
import Toolbar from "@mui/material/Toolbar";
import Typography from "@mui/material/Typography";
import Button from "@mui/material/Button";
import IconButton from "@mui/material/IconButton";
import MenuIcon from "@mui/material/Menu";
import { AuthContext } from "../../App";
import { signOut } from "../../lib/api/auth";

const StyledIconButton = styled(IconButton)(() => ({
  marginRight: 10,
}));

const StyledTitle = styled(Typography)(() => ({
  flexGrow: 1,
  textDecoration: "none",
  color: "inherit",
}));

const StyledLinkButton = styled(Button)(() => ({
  textTransform: "none",
}));

const Header: React.FC = () => {
  const { loading, isSignedIn, setIsSignedIn } = useContext(AuthContext);
  const histroy = useHistory();

  const handleSignOut = async (e: React.MouseEvent<HTMLButtonElement>) => {
    try {
      const res = await signOut();

      if (res.data.success === true) {
        // サインアウト時には各Cookieを削除
        Cookies.remove("_access_token");
        Cookies.remove("_client");
        Cookies.remove("_uid");

        setIsSignedIn(false);
        histroy.push("/signin");

        console.log("Succeeded in sign out");
      } else {
        console.log("Failed in sign out");
      }
    } catch (err) {
      console.log(err);
    }
  };

  const AuthButtons = () => {
    // 認証完了後はサインアウト用のボタンを表示
    // 未認証時は認証用のボタンを表示
    if (!loading) {
      if (isSignedIn) {
        return (
          <StyledLinkButton color="inherit" onClick={handleSignOut}>
            サインアウト
          </StyledLinkButton>
        );
      } else {
        return (
          <Link to="/signin">
            <StyledLinkButton color="inherit">サインイン</StyledLinkButton>
          </Link>
        );
      }
    } else {
      return <></>;
    }
  };

  return (
    <>
      <AppBar position="static">
        <Toolbar>
          <StyledIconButton edge="start" color="inherit">
            <MenuIcon open={false} />
          </StyledIconButton>
          <Link to="/">
            <StyledTitle variant="h6">Sample</StyledTitle>
          </Link>

          <AuthButtons />
        </Toolbar>
      </AppBar>
    </>
  );
};

export default Header;
