const weather_form = document.getElementById('weatherForm');
const submit = weather_form.children[4];
const latitude = document.getElementById('latitude');
const longitude = document.getElementById('longitude');
const weather_result =document.getElementById('weatherResult');

const get_data= (lat, lon) => {
    fetch(`http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=322a794e8ed121919a98bd4504824c1d`)
      .then(response => response.json())
      .then(data => {
        show_data({temp: data.main.temp - 273.15, weather: data.weather[0].description});
      })
      .catch(err => console.error(err));
}

const show_data = (data) => {
    const p_temp = document.createElement('p');
    const p_weather = document.createElement('p');
    p_temp.textContent = `現在の気温は${data.temp}です`;
    p_weather.textContent = `現在の天気は${data.weather}です`;
    weather_result.appendChild(p_temp);
    weather_result.appendChild(p_weather);
}

submit.addEventListener('click', () => {
    event.preventDefault();
    let lat = Number(latitude.value);
    let lon = Number(longitude.value)
    get_data(lat, lon);
}, false);