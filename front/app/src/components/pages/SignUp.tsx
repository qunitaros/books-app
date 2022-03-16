import React from "react";
import Card from "@mui/material/Card";
import CardHeader from "@mui/material/CardHeader";
import CardContent from "@mui/material/CardContent";
import TextField from "@mui/material/TextField";
import Button from "@mui/material/Button";
import { styled } from "@mui/material/styles";
import useSignUp from "../../lib/hooks/useSignUp";
import AlertMessage from "../utils/AlertMessage";

const StyledCard = styled(Card)(() => ({
  padding: 10,
  maxWidth: 400,
}));

const StyledButton = styled("div")(() => ({
  paddingTop: "1rem",
  textAlign: "right",
  flexGrow: 1,
  textTransform: "none",
}));

const SignUp = () => {
  const {
    name,
    setName,
    email,
    setEmail,
    password,
    setPassword,
    passwordConfirmation,
    setPasswordConfirmation,
    alertMessageOpen,
    setAlertMessageOpen,
    handleSubmit,
  } = useSignUp();

  return (
    <>
      <form noValidate autoComplete="off">
        <StyledCard>
          <CardHeader sx={{ textAlign: "center" }} title="サインアップ" />
          <CardContent>
            <TextField
              variant="outlined"
              required
              fullWidth
              label="名前"
              value={name}
              margin="dense"
              onChange={(event) => setName(event.target.value)}
            />
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
              value={password}
              margin="dense"
              autoComplete="current-password"
              onChange={(event) => setPassword(event.target.value)}
            />
            <TextField
              variant="outlined"
              required
              fullWidth
              label="パスワード（確認用）"
              type="password"
              value={passwordConfirmation}
              margin="dense"
              autoComplete="current-password"
              onChange={(event) => setPasswordConfirmation(event.target.value)}
            />
            <StyledButton>
              <Button
                type="submit"
                variant="outlined"
                color="primary"
                disabled={
                  !name || !email || !password || !passwordConfirmation
                    ? true
                    : false
                }
                onClick={handleSubmit}
              >
                送信
              </Button>
            </StyledButton>
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

export default SignUp;
