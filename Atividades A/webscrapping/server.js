//webscrapping usando puppeteer e express

const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto('https://reciprev.recife.pe.gov.br/');
  //gera um png do site em que vc colocou o link a cima
  await page.screenshot({ path: 'png_do_site_esperado.png' });
  await browser.close();
})();