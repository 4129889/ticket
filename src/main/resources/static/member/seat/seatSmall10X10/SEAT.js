window.onload = function () {
  localStorage.removeItem("selectedSeats");
};
window.addEventListener("unload", function () {
  localStorage.removeItem("selectedSeats");
});

var container = document.querySelector(".container");
var seats = document.querySelectorAll(".row .seat:not(.sold)");
var count = document.getElementById("count");
var total = document.getElementById("total");
var actSelect = document.getElementById("act");

// populateUI();

var ticketPrice = actSelect.value;
console.log(ticketPrice);

function setActData(actIndex, actPrice) {
  localStorage.setItem("selectedActIndex", actIndex);
  localStorage.setItem("selectedActPrice", actPrice);
}

// 更新數量跟價錢
function updateSelectedCount() {
  let selectedSeats = document.querySelectorAll(".row .seat.selected");

  let seatsIndex = [...selectedSeats].map((seat) => [...seats].indexOf(seat));

  localStorage.setItem("selectedSeats", JSON.stringify(seatsIndex));

  let selectedSeatsCount = selectedSeats.length;

  count.innerText = selectedSeatsCount;
  total.innerText = selectedSeatsCount * ticketPrice;

  setActData(actSelect.selectedIndex, actSelect.value);
}

// 從 localstorage and populate UI 拿到資料
function populateUI() {
  let selectedSeats = JSON.parse(localStorage.getItem("selectedSeats"));

  if (selectedSeats !== null && selectedSeats.length > 0) {
    seats.forEach((seat, index) => {
      if (selectedSeats.indexOf(index) > -1) {
        seat.classList.add("selected");
      }
    });
  }

  let selectedActIndex = localStorage.getItem("selectedActIndex");

  if (selectedActIndex !== null) {
    actSelect.selectedIndex = selectedActIndex;
    console.log(selectedActIndex);
  }
}

actSelect.addEventListener("change", (e) => {
  ticketPrice = +e.target.value;
  setActData(e.target.selectedIndex, e.target.value);
  updateSelectedCount();
});

// 座位點擊動作
container.addEventListener("click", (e) => {
  if (
    e.target.classList.contains("seat") &&
    !e.target.classList.contains("sold")
  ) {
    if (e.target.classList.contains("selected")) {
      e.target.classList.remove("selected");
    } else {
      e.target.classList.add("selected");
    }
    updateSelectedCount();
  }
});

//座位編號
let seats1 = document.querySelectorAll(".seat");

// 編號測試
seats1.forEach((seat, index) => {
  seat.textContent = `${index + 1}`;
});

let seats2 = document.querySelectorAll(".seat"); // 找座位

seats2.forEach((seat) => {
  seat.addEventListener("click", () => {
    if (
      !seat.classList.contains("sold") &&
      !seat.classList.contains("selected")
    ) {
      let seatNumber = seat.textContent;
      console.log(`座位 ${seatNumber}`);
    } else if (seat.classList.contains("selected")) {
      console.log("cancel");
    } else {
      console.log("0");
    }
  });
});
container.addEventListener("mousemove", (event) => {
  if (event.target.classList.contains("seat")) {
    let seatNumber1 = event.target.textContent;
    let rowIndex1 = Math.ceil(seatNumber1 / 10);
    let seatIndex1 = seatNumber1 % 10 === 0 ? 10 : seatNumber1 % 10;

    let infoSpan = document.getElementById("seat-info");
    if (!infoSpan) {
      infoSpan = document.createElement("span");
      infoSpan.id = "seat-info";
      infoSpan.style.position = "absolute";
      infoSpan.style.left = event.pageX + 30 + "px";
      infoSpan.style.top = event.pageY + "px";
      document.body.appendChild(infoSpan);
    } else {
      infoSpan.textContent = `座位 ${seatNumber1} 在 ${rowIndex1} 排，第 ${seatIndex1} 列`;
      container.addEventListener("mouseout", () => {
        infoSpan.remove();
      });
      if (event.target.classList.contains("sold")) {
        infoSpan.textContent = `已售出，座位 ${seatNumber1} 在 ${rowIndex1} 排，第 ${seatIndex1} 列`;
        container.addEventListener("mouseout", () => {
          infoSpan.remove();
        });
      }
    }
  }
});

// -------------TEST-----------------//

var seatDivs = document.querySelectorAll(".seat");

seatDivs.forEach(function (seat, index) {
  seat.id = "seat_" + (index + 1);
});

var seatIdToChange = "seat_5"; //這裡更改號碼

var seatElement = document.getElementById(seatIdToChange);

if (seatElement) {
  seatElement.classList.add("sold");
}
