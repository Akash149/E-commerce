const signupBtn = document.querySelector(".signupBtn");
const loginBtn = document.querySelector(".loginBtn");
const moveBtn = document.querySelector(".moveBtn");
const signup = document.querySelector(".signup");
const signin = document.querySelector(".signin");

function actionr() {
    moveBtn.classList.add("rightBtn");
    signup.classList.remove("signupForm");
    signin.classList.add("signinForm");
    document.title="Signin";
    moveBtn.innerHTML="Signin";
}

function action() {
    moveBtn.classList.remove("rightBtn");
    signin.classList.remove("signinForm");
    signup.classList.add("signupForm");
    document.title="Signup";
    moveBtn.innerHTML="Signup";
}



