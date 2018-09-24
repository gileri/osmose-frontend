export function setCookie(cName, value, exdays) {
  const exdate = new Date();
  exdate.setDate(exdate.getDate() + exdays);
  const cValue = escape(value) + ((exdays == null) ? '' : `; path=/; expires=${exdate.toUTCString()}`);
  document.cookie = `${cName}=${cValue}`;
}

export function getUrlVars() {
  const vars = {};
  let hash;
  if (window.location.href.indexOf('#') >= 0) {
    const hashes = window.location.href.slice(window.location.href.indexOf('#') + 1).split('&');
    for (let i = 0; i < hashes.length; i += 1) {
      hash = hashes[i].split('=');
      vars[decodeURIComponent(hash[0])] = decodeURIComponent(hash[1]);
    }
  }
  return vars;
}
