document.getElementById("toggleMapCheckbox").addEventListener("change", function(){
  const map = document.getElementById("map");
  const mapCards = document.getElementById("mapCards");
  const cards = document.getElementsByClassName('user-card');
  console.log(cards)
  if (map.style.display === "none") {
    map.style.display = "block";
    mapCards.classList.remove("col-md-12");
    Array.prototype.forEach.call(cards, function (card) {
	    card.classList.remove("col-md-3");
      	card.classList.add("col-md-4");
    });
  } else {
    map.style.display = "none";
    mapCards.classList.add("col-md-12");
    Array.prototype.forEach.call(cards, function (card) {
      	card.classList.remove("col-md-4");
	    card.classList.add("col-md-3");
    });
  }
});
