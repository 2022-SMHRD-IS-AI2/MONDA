// 워크스페이스를 드래그, 요소가 변경된 위치를 인식하여 DB를 변경한다.

// 컨테이너가 들어갈 박스
// var plans = document.getElementsByClassName('myPlan');
const draggables = document.querySelectorAll(".draggable");
const containers = document.querySelectorAll(".container");

draggables.forEach(draggable => {
  draggable.addEventListener("dragstart", () => {
    draggable.classList.add("dragging");
  });

  // DB에서 Workspace의 데이터를 변경해야함

  draggable.addEventListener("dragend", () => {
    var dragid = $(".dragging").parent().attr('id');
    console.log("드래그 된 위치 : " + dragid);
    if(dragid=="planSpace"){
      console.log("계획중")
    }else if (dragid=="processSpace"){
      console.log("진행중")
    }else if(dragid=="endSpace"){
      console.log("완료")
    }

    draggable.classList.remove("dragging");
  });
});

containers.forEach(container => {
  container.addEventListener("dragover", e => {
    e.preventDefault();
    const draggable = document.querySelector(".dragging");
    container.appendChild(draggable);
  });
});


// 오류 있는 스크립트 - 백업용
// 컨테이너가 들어갈 박스
// var plan = document.getElementsByClassName('myPlan');
// // Uncaught TypeError: Failed to execute 'appendChild' on 'Node': parameter 1 is not of type 'Node'.draganddrop.html:20 dropdraganddrop.html:26 ondrop
// // 컨테이너
// const containers = document.querySelectorAll(".container");

// ->이게 작동을 안하고 있었던거임
// // 짭배열 배열 인식하게 해주기 Array.from(array-형태-객채)
// Array.from(plan).forEach(plan => {
//   plan.addEventListener("dragstart", () => {
//     // 드래그할 때
//     plan.classList.add("dragging");
//   });

//   plan.addEventListener("dragend", () => {
//     plan.classList.remove("dragging");
//   });
// });

// containers.forEach(container => {
//   container.addEventListener("dragover", e => {
//     e.preventDefault();
//     var plan = document.querySelector(".myPlan");
//     container.appendChild(plan);
//   });
// });

