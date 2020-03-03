function randombg(){
  var random= Math.floor(Math.random() * 6) + 0;
  var bigSize = ["url('assets/backgrounds/germana2.jpg')",
                 "url('assets/backgrounds/germana3.jpg')",
                 "url('assets/backgrounds/hantai.jpg')",
                 "url('assets/backgrounds/hantai2.jpg')",
                 "url('assets/backgrounds/julio.jpg')"];
  document.getElementById("random").style.backgroundImage=bigSize[random];
}

export { randombg }
