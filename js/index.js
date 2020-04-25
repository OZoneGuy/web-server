
function showSection(name){
    var navItems = document.getElementsByClassName("nav")[0].children;

    var i;
    for (i = 0; i < navItems.length; i++){
        navItems[i].classList.remove("active");
    }

    var divs = document.querySelectorAll('div[id$=Div]');
    for (i = 0;i < divs.length; i++){
        divs[i].classList.remove("active");
    }

    document.getElementById(name).classList.add("active");
    document.getElementById(name + "Div").classList.add("active");

}
