document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('weatherForm');
  if (!form) return;

  form.addEventListener('submit', async (e) => {
    e.preventDefault();

    const destId = document.getElementById('destinationSelect').value;
    const travelDate = document.getElementById('travelDate').value;
    const box = document.getElementById('weatherResult');

    if (!destId) return;

    box.innerHTML = '<div class="info-note">Loading forecast…</div>';

    try {
      let url = `/api/get_weather.php?destination_id=${encodeURIComponent(destId)}`;
      if (travelDate) url += `&travel_date=${encodeURIComponent(travelDate)}`;

      const data = await apiGet(url);

      if (data.error) {
        box.innerHTML = `<div class="info-note">${data.error}</div>`;
        return;
      }

      renderWeatherResult(data, box);
    } catch (err) {
      console.error('Weather fetch failed', err);
      box.innerHTML = '<div class="info-note">Something went wrong fetching the forecast. Please try again.</div>';
    }
  });
});