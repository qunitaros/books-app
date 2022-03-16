import Cookies from "js-cookie";
import { useContext, useState } from "react";
import { useHistory } from "react-router-dom";
import { AuthContext } from "../../App";
import { SignUpData } from "../../interfaces";
import { signUp } from "../api/auth";

const useSignUp = () => {
  const histroy = useHistory();

  const { setIsSignedIn, setCurrentUser } = useContext(AuthContext);

  const [name, setName] = useState<string>("");
  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [passwordConfirmation, setPasswordConfirmation] = useState<string>("");
  const [alertMessageOpen, setAlertMessageOpen] = useState<boolean>(false);

  const handleSubmit = async (e: React.MouseEvent<HTMLButtonElement>) => {
    e.preventDefault();

    const data: SignUpData = {
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    };

    try {
      const res = await signUp(data);
      console.log(res);

      if (res.status === 200) {
        // アカウント作成と同時にサインインさせてしまう
        // 本来であればメール確認などを挟むべきだが、今回はサンプルなので
        Cookies.set("_access_token", res.headers["access-token"]);
        Cookies.set("_client", res.headers["client"]);
        Cookies.set("_uid", res.headers["uid"]);

        setIsSignedIn(true);
        setCurrentUser(res.data.data);

        histroy.push("/");

        console.log("Signed in successfully!");
      } else {
        setAlertMessageOpen(true);
      }
    } catch (err) {
      console.log(err);
      setAlertMessageOpen(true);
    }
  };
  return {
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
  };
};

export default useSignUp;
