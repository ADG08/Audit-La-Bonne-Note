const container = document.querySelector(".container"),
    showHide = document.querySelectorAll(".showHide"),
    password = document.querySelectorAll(".password");

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
        })
    })