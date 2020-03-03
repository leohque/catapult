function randombg(){
  var random= Math.floor(Math.random() * 6) + 0;
  var bigSize = ["url('assets/backgrounds/julio.jpg')"];
  document.getElementById("random").style.backgroundImage=bigSize[random];
}

export { randombg }
