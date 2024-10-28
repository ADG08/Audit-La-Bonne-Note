const container = document.querySelector(".container");
const showHide = document.querySelectorAll(".showHide");
const username = document.querySelectorAll("prenom");
const password = document.querySelectorAll(".motdepasse");
const password2 = document.querySelectorAll(".motdepasse2");
const email = document.querySelectorAll('.email');
const erreur = document.querySelectorAll('.erreur');


/*voir le mdp dans les champs .motdepasse*/
showHide.forEach(eyeIcon =>{
    eyeIcon.addEventListener("click", ()=>{
        password.forEach(password =>{
            if(password.type=="password"){
                password.type ="text";

                showHide.forEach(icon =>{
                    icon.classList.replace("fa-eye-slash","fa-eye")
                })
            }else{
                password.type ="password";

                showHide.forEach(icon =>{
                    icon.classList.replace("fa-eye","fa-eye-slash")
                })
            }
        })
        password2.forEach(password =>{
            if(password.type=="password"){
                password.type ="text";

                showHide.forEach(icon =>{
                    icon.classList.replace("fa-eye-slash","fa-eye")
                })
            }else{
                password.type ="password";

                showHide.forEach(icon =>{
                    icon.classList.replace("fa-eye","fa-eye-slash")
                })
            }
        })
    })
})
/*fin voir le mdp dans les champs .motdepasse*/

/*lance de la fonction checkInputs*/
form.addEventListener('submit', e => {
	e.preventDefault();
	checkInputs();
});

/*fonction checkInput*/
function checkInputs() {   
    if(email == '') {
        setErrorFor(email, "L'email ne peut pas être vide");
    } else if (!isEmail(email)) {
        setErrorFor(email, 'Email pas valide');
    } else {
        setSuccessFor(email);
    }
    
    if(password == '') {
        setErrorFor(password, 'MDP ne peut pas être vide');
    } else if (password.length < 8){
        setErrorFor(password, 'Le MDP doit faire minimum 8 caractères');
    }else {
        setSuccessFor(password);
    }
    
    if(password2 == '') {
        setErrorFor(password2, 'MDP ne peut pas être vide');
    } else if(password !== password2) {
        setErrorFor(password2, 'Les MDP ne correspondent pas');
    } else{
        setSuccessFor(password2);
    }
}


/*fonction error, succes*/
function setErrorFor(input, message) {
    console.log(input);

    const formControl = input.parentElement;
    const small = formControl.querySelector('small');
    formControl.className = 'input-box error';
    small.innerText = message;
}

function setSuccessFor(input) {
    const formControl = input.parentElement;
    formControl.className = 'input-box success';
}

/*est un email*/
function isEmail(email) {
	return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}