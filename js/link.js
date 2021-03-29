// https://oldj.net/article/2017/01/23/shuffle-an-array-in-javascript/
function shuffle(arr) {
  let i = arr.length;
  while (i) {
    let j = Math.floor(Math.random() * i--);
    [arr[j], arr[i]] = [arr[i], arr[j]];
  }
}

// https://tding.top/archives/73ce4e7.html
function renderlink(data) {
  var nickname, avatar, site, li = "";
  shuffle(data);
  for (var i = 0; i < data.length; i++) {
    nickname = data[i].nickname;
    avatar = data[i].avatar;
    site = data[i].site;
    li += '<div class="card">' + '<a href="' + site + '" target="_blank">' + '<div class="thumb" style="background: url( ' + avatar + ');">' + '</div>' + '</a>' + '<div class="card-header">' + '<div><a href="' + site + '" target="_blank">' + nickname + '</a></div>' + '</div>' + '</div>';
  }
  document.getElementsByClassName("link-navigation")[0].innerHTML = li;
}

fetch('/links/linklist.json')
  .then(response => response.json())
  .then(res => renderlink(res));
