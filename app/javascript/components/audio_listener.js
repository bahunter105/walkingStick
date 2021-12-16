
const audioListener = () => {
  let audio = document.querySelector("audio")
  if (audio) {
    audio.addEventListener('timeupdate', function () {
      let starttime = this.currentTime;
      if (starttime > 5 && starttime < 5.2) {
        console.log('5 seconds reached');
      }
    });
  };
}

export { audioListener };
