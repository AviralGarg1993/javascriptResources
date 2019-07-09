function func() {
  if(window.find(`119242`)){
    document.title = 'result is out';
    alert(`result is out`);
  } else {
    // empty cache and hard refresh (hopefully)
    location.reload(true);
  }
}

setTimeout(func, 5000);
