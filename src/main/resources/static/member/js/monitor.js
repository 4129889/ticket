/**
 * 
 */

   container.addEventListener("mousemove", (event) => {
        if (event.target.classList.contains("seat")) {
          let seatNumber1 = event.target.textContent;
          let rowIndex1 = Math.ceil(seatNumber1 / 20);
          let seatIndex1 = seatNumber1 % 20 === 0 ? 20 : seatNumber1 % 20;

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