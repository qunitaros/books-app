import React from "react";

import Grid from "@mui/material/Grid";
import Container from "@mui/material/Container";
import { styled } from "@mui/material/styles";

import Header from "./Header";

const StyledContainer = styled(Container)(() => ({
  paddingTop: "3rem",
}));

interface CommonLayoutProps {
  children: React.ReactElement;
}

// 全てのページで共通となるレイアウト
const CommonLayout = ({ children }: CommonLayoutProps) => {
  return (
    <>
      <header>
        <Header />
      </header>
      <main>
        <StyledContainer maxWidth="lg">
          <Grid container justifyContent="center">
            <Grid item>{children}</Grid>
          </Grid>
        </StyledContainer>
      </main>
    </>
  );
};

export default CommonLayout;
