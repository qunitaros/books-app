import React from "react";
import { Link } from "react-router-dom";

import Box from "@mui/material/Box";
import Card from "@mui/material/Card";
import CardHeader from "@mui/material/CardHeader";
import CardContent from "@mui/material/CardContent";
import TextField from "@mui/material/TextField";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import { styled } from "@mui/material/styles";
import useSignIn from "../../lib/hooks/useSignIn";
import AlertMessage from "../utils/AlertMessage";

const StyledButton = styled(Box)(() => ({
  paddingTop: 10,
  textAlign: "right",
  flexGrow: 1,
  textTransform: "none",
}));

const StyledHeader = styled(CardHeader)(() => ({
  textAlign: "center",
}));

const StyledCard = styled(Card)(() => ({
  padding: 10,
  maxWidth: 400,
}));

const SignIn = () => {
  const {
    email,
    setEmail,
    password,
    setPassword,
    alertMessageOpen,
    setAlertMessageOpen,
    handleSubmit,
  } = useSignIn();

  return (
    <>
      <form noValidate autoComplete="off">
        <StyledCard>
          <StyledHeader title="サインイン" />
          <CardContent>
            <TextField
              variant="outlined"
              required
              fullWidth
              label="メールアドレス"
              value={email}
              margin="dense"
              onChange={(event) => setEmail(event.target.value)}
            />
            <TextField
              variant="outlined"
              required
              fullWidth
              label="パスワード"
              type="password"
              placeholder="6文字以上"
              value={password}
              margin="dense"
              autoComplete="current-password"
              onChange={(event) => setPassword(event.target.value)}
            />
            <StyledButton>
              <Button
                type="submit"
                variant="outlined"
                color="primary"
                disabled={!email || !password ? true : false}
                onClick={handleSubmit}
              >
                送信
              </Button>
            </StyledButton>
            <Box textAlign="center" sx={{ paddingTop: "2rem" }}>
              <Typography variant="body2">
                まだアカウントをお持ちでない方は
                <Link to="/signup" style={{ textDecoration: "none" }}>
                  こちら
                </Link>
                から作成してください。
              </Typography>
            </Box>
          </CardContent>
        </StyledCard>
      </form>
      <AlertMessage // エラーが発生した場合はアラートを表示
        open={alertMessageOpen}
        setOpen={setAlertMessageOpen}
        severity="error"
        message="メールアドレスかパスワードが間違っています"
      />
    </>
  );
};

export default SignIn;
