let $=require('jquery');
let playBtn=document.getElementById('video-play-button');
let posterImg=document.getElementById('poster-img');
let playerContainer=document.getElementById('jquery_jplayer_1');
let videoPlayer=document.getElementById('video-player');
let playerCurrent=document.getElementById('player-current');
let playerDuration=document.getElementById('player-duration');
let playerProgress=document.getElementById('player-progress');
let playerSeekBar=document.getElementById('player-seek-bar');
let playerPause=document.getElementById('video-player-pause');
// let playerFullscreen=document.getElementById('player-fullscreen');
// playerFullscreen.addEventListener('click',function(e){
//     let el=e.target;
//     if(el.mozRequestFullScreen){
//         el.mozRequestFullScreen();
//     }else if(el.webkitRequestFullScreen){
//         el.webkitRequestFullScreen();
//     }
// });
if(videoPlayer){
    playBtn.addEventListener('click',playVideo);
playerContainer.addEventListener('click',videoAction);
playerPause.addEventListener('click',videoAction);
playerSeekBar.addEventListener('click',function(e){
    let el=$(this);
    let width=el.width();
    let posx=el.offset().left;
    let x=e.pageX-posx;
    x=parseInt(x/width*100,10);
    x=x<0 ? 0:x;
    x=x>100?100:x;
    videoSeek(x);
});
$(videoPlayer).on('play',function(e){
    playBtn.style.display="none";
    posterImg.style.display="none";
    videoPlayer.style.backgroundColor="black";
});
videoPlayer.addEventListener('timeupdate',function(e){
   let currentTime=timeFormat(this.currentTime);
   let duration=timeFormat(this.duration);
   let percentage=Math.floor((100/this.duration)*this.currentTime);
    playerDuration.innerText=duration;
    playerCurrent.innerText=currentTime;
    playerProgress.style.width=`${percentage}%`;
});
}
function videoSeek(x){
    let value=(videoPlayer.duration)*(x/100);
    console.log(value,x,videoPlayer.duration);
    videoPlayer.currentTime=value;
}
function playVideo(e){
    e.target.style.display="none";
    posterImg.style.display="none";
    videoPlayer.style.display="block";
}
function videoAction(e){
    if(videoPlayer.paused==true){
        videoPlayer.play();
    }else{
        videoPlayer.pause();
    }
}
function timeFormat(time){
    let minutes=Math.floor(time/60);
    let seconds=Math.floor(time-minutes *60);
    return `${minutes}:${seconds}`;
}



