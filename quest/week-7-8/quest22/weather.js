const weatherForm = document.querySelector("#weatherForm");
const submit = weatherForm.children[4];
const latitude = document.querySelector("#latitude");
const longitude = document.querySelector("#longitude");
const weatherResult = document.querySelector("#weatherResult");

const getData = (lat, lon) => {
  fetch(
    `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=`
  )
    .then((response) => response.json())
    .then((data) => {
      showData({
        temp: data.main.temp - 273.15,
        weather: data.weather[0].description,
      });
    })
    .catch((err) => console.error(err));
};

const showData = (data) => {
  const pTemp = document.createElement("p");
  const pWeather = document.createElement("p");
  pTemp.textContent = `現在の気温は${data.temp}です`;
  pWeather.textContent = `現在の天気は${data.weather}です`;
  weatherResult.appendChild(pTemp);
  weatherResult.appendChild(pWeather);
};

submit.addEventListener(
  "click",
  () => {
    event.preventDefault();
    let latitudeNum = Number(latitude.value);
    let longitudeNum = Number(longitude.value);
    getData(latitudeNum, longitudeNum);
  },
  false
);
