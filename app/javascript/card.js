const pay = () => {
  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    console.log("イベント発火")
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);