// 계획 중 워크스페이스 추가
function planDIV() {
    console.log("계획 중 워크스페이스 추가 함수 작동 확인");
    // DOM객체 생성
    obj = document.getElementById("planSpace");
    newDiv = document.createElement("div");
    newDiv.innerHTML = '<form><div class="mt-2" draggable="false"><div class="h-auto p-4 border rounded-md bg-gray-100 grow text-sm font-medium border-brand-300"><select><option>프로젝트 이름1</option></select><div style="text-align : center"><input type="date" class="w-40%">➔ <input type="date" class="w-40%"></div><div class="text-right"><input type="text" placeholder="워크스페이스 이름"style="width: 80%;float:left;"><br><a class="self-start text-xs text-gray-400 "href="http://test.com">요청자</a></div><div></div><textarea class="autosize" onkeydown="resize(this)"onkeyup="resize(this) style="padding: 10px;""></textarea><br><div style="text-align : right;"><input type="submit" style="margin:auto"></div></div></div></form>';
    newDiv.setAttribute("class","myPlan")
    obj.append(newDiv);

    // // 워크스페이스가 존재할 때
    // if (planSize !== 0) {
    //     newDiv.innerHTML = '<form><div class="mt-2" draggable="true"><div class="h-auto p-4 border rounded-md bg-gray-100 grow text-sm font-medium border-brand-300"><select><option>프로젝트 이름1</option></select><div style="text-align : center"><input type="date" class="w-40%">➔ <input type="date" class="w-40%"></div><div class="text-right"><input type="text" placeholder="워크스페이스 이름"style="width: 80%;float:left;"><br><a class="self-start text-xs text-gray-400 "href="http://test.com">요청자</a></div><div></div><textarea class="autosize" onkeydown="resize(this)"onkeyup="resize(this)"></textarea><br><div style="text-align : right;"><input type="submit" style="margin:auto"></div></div></div></form>';
    //     newDiv.setAttribute("class", "myPlan");
    //     newDiv.after(newDiv);
    //     // 워크스페이스가 존재하지 않을 때
    // } else if (planSize == 0) {
    //     obj = document.querySelector(".noplan");
    //     obj.innerHTML = '<form><div class="mt-2" draggable="false"><div class="h-auto p-4 border rounded-md bg-gray-100 grow text-sm font-medium border-brand-300"><select><option>프로젝트 이름1</option></select><div style="text-align : center"><input type="date" class="w-40%">➔ <input type="date" class="w-40%"></div><div class="text-right"><input type="text" placeholder="워크스페이스 이름"style="width: 80%;float:left;"><br><a class="self-start text-xs text-gray-400 "href="http://test.com">요청자</a></div><div></div><textarea class="autosize" onkeydown="resize(this)"onkeyup="resize(this)"></textarea><br><div style="text-align : right;"><input type="submit" style="margin:auto"></div></div></div></form>';
    //     obj.setAttribute("class", "myPlan");
    // }
    // obj.after(newDiv);
    // console.log("워크스페이스 개수 : " + planSize);
}


// 진행 중 워크스페이스 추가
function processDIV() {
    console.log("진행 중 워크스페이스 추가 함수 작동 확인");

    obj = document.getElementById("processSpace");
    newDiv = document.createElement("div");
    newDiv.innerHTML = '<form><div class="mt-2" draggable="false"><div class="h-auto p-4 border rounded-md bg-gray-100 grow text-sm font-medium border-brand-300"><select><option>프로젝트 이름1</option></select><div style="text-align : center"><input type="date" class="w-40%">➔ <input type="date" class="w-40%"></div><div class="text-right"><input type="text" placeholder="워크스페이스 이름"style="width: 80%;float:left;"><br><a class="self-start text-xs text-gray-400 "href="http://test.com">요청자</a></div><div></div><textarea class="autosize" onkeydown="resize(this)"onkeyup="resize(this)"></textarea><br><div style="text-align : right;"><input type="submit" style="margin:auto"></div></div></div></form>';
    newDiv.setAttribute("class","myPlan")
    obj.append(newDiv);
    
    // var planSize = document.getElementsByClassName('myProcess').length;
    // obj = document.getElementById("processSpace");
    // newDiv = document.createElement("div");
    // console.log(planSize);
    // if (planSize !== 0) {
    //     newDiv.innerHTML = '<form><div class="mt-2 draggable" draggable="true"><div class="h-auto p-4 border rounded-md bg-gray-100 grow text-sm font-medium border-brand-300"><select><option>프로젝트 이름1</option></select><div style="text-align : center"><input type="date" class="w-40%">➔ <input type="date" class="w-40%"></div><div class="text-right"><input type="text" placeholder="워크스페이스 이름"style="width: 80%;float:left;"><br><a class="self-start text-xs text-gray-400 "href="http://test.com">요청자</a></div><div></div><textarea class="autosize" onkeydown="resize(this)"onkeyup="resize(this)"></textarea><br><div style="text-align : right;"><input type="submit" style="margin:auto"></div></div></div></form>';
    //     newDiv.setAttribute("class", "myProcess");
    // } else if (planSize == 0) {
    //     obj.innerHTML = '<form><div class="mt-2 draggable" draggable="true"><div class="h-auto p-4 border rounded-md bg-gray-100 grow text-sm font-medium border-brand-300"><select><option>프로젝트 이름1</option></select><div style="text-align : center"><input type="date" class="w-40%">➔ <input type="date" class="w-40%"></div><div class="text-right"><input type="text" placeholder="워크스페이스 이름"style="width: 80%;float:left;"><br><a class="self-start text-xs text-gray-400 "href="http://test.com">요청자</a></div><div></div><textarea class="autosize" onkeydown="resize(this)"onkeyup="resize(this)"></textarea><br><div style="text-align : right;"><input type="submit" style="margin:auto"></div></div></div></form>';
    //     obj.setAttribute("class", "myProcess");
    // }
    // obj.appendChild(newDiv);
}

