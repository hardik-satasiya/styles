---
name: Layout
category: Navigation
---

## Description

_Layout_ is used to create the layout of your application. It occupies
`olt-Layout` class names.

```layout.css
body {
  margin: 0;
  padding: 0;
}
```

```layout.js
const navigationItems = [...document.querySelectorAll('[data-item]')];
const secondaryItems = [...document.querySelectorAll('[data-name]')];
const actionItems = [...document.querySelectorAll('[data-action]')];
navigationItems.forEach( item => item.addEventListener('click', event => {
  event.preventDefault();
  const name = item.getAttribute('data-item');
  secondaryItems.forEach( item => {
    item.classList.remove('is-open');
    item.classList.remove('is-hidden');
    if ( item.getAttribute('data-name') === name ) {
      item.classList.add('is-open');
    }
  } );
  if ( item.classList.contains('is-active') ) { return; }
  navigationItems.forEach( item => item.classList.remove('is-active') );
  item.classList.add('is-active');
}));
actionItems.forEach( item => item.addEventListener('click', event => {
  if ( item.getAttribute('data-action') === "back" ) {
    const activeSecondaryItem = secondaryItems
       .find( item => item.classList.contains('is-open') );
    activeSecondaryItem.classList.add('is-hidden');
  }
  if ( item.getAttribute('data-action') === "open" ) {
    document.getElementById("sidebar").classList.add("is-open");
  }
  if ( item.getAttribute('data-action') === "close" ) {
    document.getElementById("sidebar").classList.remove("is-open");
    const activeSecondaryItem = secondaryItems
       .find( item => item.classList.contains('is-open') );
    if ( activeSecondaryItem ) {
      activeSecondaryItem.classList.remove('is-hidden');
      activeSecondaryItem.classList.remove('is-open');
    }
  }
}));
```

```layout.html
<div class="olt-Layout">
   <header class="olt-Header olt-ActionButton--proximity-area">
      <div class="olt-Header-logo">
         <!-- Replace the src with your logo path -->
         <img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iMTUycHgiIGhlaWdodD0iMTJweCIgdmlld0JveD0iMCAwIDE1MiAxMiIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIj4KICAgIDxwYXRoIGQ9Ik0yMC44MTA5OTM2LDEuNTE5NDY2ODYgQzIxLjI4NTI2NDcsMS41MTk0NjY4NiAyMS43NDQ4NzQ1LDEuNTkwNzc0MTMgMjIuMTg5Mzc4NywxLjczMzE2NjUzIEMyMi42MzM2NjA4LDEuODc1MzM2NzkgMjMuMDM0ODQ3NSwyLjA4NDgxNTc4IDIzLjM5MjkzODgsMi4zNjA3MTQ5NCBDMjMuNzUwODA4LDIuNjM3MDU4MzkgMjQuMDQ2NDc3NywyLjk3NzgyMjczIDI0LjI3OTUwMzcsMy4zODM0NTIyNSBDMjQuNTEyNTI5NiwzLjc4ODg1OTYzIDI0LjY1NDY5OTksNC4yNTQ2ODkzNyAyNC43MDY2ODA5LDQuNzgxMTYzNjEgTDIyLjc2NTM5MDQsNC43ODExNjM2MSBDMjIuNjQ0MzIzNiw0LjI2MzM1Mjg3IDIyLjQxMTUxOTgsMy44NzUwNTAzNSAyMi4wNjYzMTI2LDMuNjE2MDMzOTEgQzIxLjcyMTEwNTQsMy4zNTcyMzk2MSAyMS4zMDI4MTM5LDMuMjI3OTUzNTMgMjAuODEwOTkzNiwzLjIyNzk1MzUzIEMyMC4zNTMzODMxLDMuMjI3OTUzNTMgMTkuOTY1MzAyNywzLjMxNjU4NzggMTkuNjQ2MDg2MSwzLjQ5MzE4OTkyIEMxOS4zMjY4Njk0LDMuNjcwMjM2MzIgMTkuMDY4MDc1MSwzLjkwNzQ4Mjk0IDE4Ljg2OTcwMzIsNC4yMDUxNTE5MiBDMTguNjcxMTA5MSw0LjUwMjgyMDkgMTguNTI2NzE3NCw0Ljg0MTM2MzgzIDE4LjQzNjA4MzksNS4yMjEwMDI4NSBDMTguMzQ1NDUwMyw1LjYwMDg2NDAxIDE4LjMwMDEzMzYsNS45OTMzODcyMSAxOC4zMDAxMzM2LDYuMzk4Nzk0NTkgQzE4LjMwMDEzMzYsNi43ODcwOTcxMSAxOC4zNDU0NTAzLDcuMTY0NzM2ODcgMTguNDM2MDgzOSw3LjUzMTI2OTU3IEMxOC41MjY3MTc0LDcuODk4MDI0NDEgMTguNjcxMTA5MSw4LjIyODEyNTk4IDE4Ljg2OTcwMzIsOC41MjEzNTIxNCBDMTkuMDY4MDc1MSw4LjgxNDgwMDQ0IDE5LjMyNjg2OTQsOS4wNDk4MjU2NSAxOS42NDYwODYxLDkuMjI2NjQ5OTEgQzE5Ljk2NTMwMjcsOS40MDM2OTYzMSAyMC4zNTMzODMxLDkuNDkxODg2MyAyMC44MTA5OTM2LDkuNDkxODg2MyBDMjEuNDg0MDgxLDkuNDkxODg2MyAyMi4wMDM2Njg4LDkuMzIxNzI2MjcgMjIuMzcwNjQ1OCw4Ljk4MDczOTc5IEMyMi43MzcxNzg1LDguNjQwMTk3NTkgMjIuOTUwNjU2LDguMTQ1OTMzOCAyMy4wMTEwNzg0LDcuNDk4ODM2OTcgTDIwLjk2NjI3MDIsNy40OTg4MzY5NyBMMjAuOTY2MjcwMiw1Ljk4NDcyMzcxIEwyNC44NDg4NTEyLDUuOTg0NzIzNzEgTDI0Ljg0ODg1MTIsMTAuOTgwNDUzMyBMMjMuNTU0NjU3NSwxMC45ODA0NTMzIEwyMy4zNDc2MjIxLDkuOTMyMTY5ODIgQzIyLjk4NTMxLDEwLjM5Nzk5OTYgMjIuNTgzOTAxMiwxMC43MjM4ODA1IDIyLjE0NDA2MiwxMC45MDkxNDYxIEMyMS43MDQwMDA2LDExLjA5NDYzMzggMjEuMjU5NDk2NCwxMS4xODc0ODg4IDIwLjgxMDk5MzYsMTEuMTg3NDg4OCBDMjAuMTAzMjUyMywxMS4xODc0ODg4IDE5LjQ2NzA0MDQsMTEuMDY0NjQ0OCAxOC45MDE5MTM2LDEwLjgxODUxMjUgQzE4LjMzNjc4NjgsMTAuNTcyNjAyNCAxNy44NjAwNzIyLDEwLjIzNDI4MTYgMTcuNDcxNzY5Nyw5LjgwMjY2MTYgQzE3LjA4MzY4OTMsOS4zNzEyNjM3MiAxNi43ODU3OTgyLDguODY0MzM3ODkgMTYuNTc4NzYyNyw4LjI4MTg4NDExIEMxNi4zNzE3MjczLDcuNjk5NDMwMzMgMTYuMjY4MjA5Niw3LjA3MTg4MTkxIDE2LjI2ODIwOTYsNi4zOTg3OTQ1OSBDMTYuMjY4MjA5Niw1LjcwODYwMjQxIDE2LjM3MTcyNzMsNS4wNjgxNjk4MiAxNi41Nzg3NjI3LDQuNDc2ODMwNCBDMTYuNzg1Nzk4MiwzLjg4NTkzNTI2IDE3LjA4MzY4OTMsMy4zNzAxMjM3OSAxNy40NzE3Njk3LDIuOTMwMjg0NTUgQzE3Ljg2MDA3MjIsMi40OTAyMjMxNiAxOC4zMzY3ODY4LDIuMTQ1MjM4MTQgMTguOTAxOTEzNiwxLjg5NDg4NTIgQzE5LjQ2NzA0MDQsMS42NDQ3NTQ0IDIwLjEwMzI1MjMsMS41MTk0NjY4NiAyMC44MTA5OTM2LDEuNTE5NDY2ODYgWiBNOTMuODA1MDI1NiwxLjUxOTQ2Njg2IEM5NC4yNzkyOTY3LDEuNTE5NDY2ODYgOTQuNzM4Njg0NCwxLjU5MDc3NDEzIDk1LjE4MzE4ODYsMS43MzMxNjY1MyBDOTUuNjI3NDcwNywxLjg3NTMzNjc5IDk2LjAyODY1NzQsMi4wODQ4MTU3OCA5Ni4zODY3NDg3LDIuMzYwNzE0OTQgQzk2Ljc0NDYxNzksMi42MzcwNTgzOSA5Ny4wNDAyODc2LDIuOTc3ODIyNzMgOTcuMjczMzEzNiwzLjM4MzQ1MjI1IEM5Ny41MDYzMzk1LDMuNzg4ODU5NjMgOTcuNjQ4NzMxOSw0LjI1NDY4OTM3IDk3LjcwMDQ5MDgsNC43ODExNjM2MSBMOTUuNzU5MjAwMyw0Ljc4MTE2MzYxIEM5NS42MzgxMzM0LDQuMjYzMzUyODcgOTUuNDA1MzI5NiwzLjg3NTA1MDM1IDk1LjA2MDEyMjUsMy42MTYwMzM5MSBDOTQuNzE1MTM3NCwzLjM1NzIzOTYxIDk0LjI5NjYyMzcsMy4yMjc5NTM1MyA5My44MDUwMjU2LDMuMjI3OTUzNTMgQzkzLjM0NzE5MywzLjIyNzk1MzUzIDkyLjk1OTExMjYsMy4zMTY1ODc4IDkyLjY0MDExODEsMy40OTMxODk5MiBDOTIuMzIwNjc5MywzLjY3MDIzNjMyIDkyLjA2MTg4NSwzLjkwNzQ4Mjk0IDkxLjg2MzczNTIsNC4yMDUxNTE5MiBDOTEuNjY0OTE5LDQuNTAyODIwOSA5MS41MjA1MjczLDQuODQxMzYzODMgOTEuNDMwMTE1OSw1LjIyMTAwMjg1IEM5MS4zMzkyNjAyLDUuNjAwODY0MDEgOTEuMjkzOTQzNCw1Ljk5MzM4NzIxIDkxLjI5Mzk0MzQsNi4zOTg3OTQ1OSBDOTEuMjkzOTQzNCw2Ljc4NzA5NzExIDkxLjMzOTI2MDIsNy4xNjQ3MzY4NyA5MS40MzAxMTU5LDcuNTMxMjY5NTcgQzkxLjUyMDUyNzMsNy44OTgwMjQ0MSA5MS42NjQ5MTksOC4yMjgxMjU5OCA5MS44NjM3MzUyLDguNTIxMzUyMTQgQzkyLjA2MTg4NSw4LjgxNDgwMDQ0IDkyLjMyMDY3OTMsOS4wNDk4MjU2NSA5Mi42NDAxMTgxLDkuMjI2NjQ5OTEgQzkyLjk1OTExMjYsOS40MDM2OTYzMSA5My4zNDcxOTMsOS40OTE4ODYzIDkzLjgwNTAyNTYsOS40OTE4ODYzIEM5NC40Nzc4OTA4LDkuNDkxODg2MyA5NC45OTc0Nzg3LDkuMzIxNzI2MjcgOTUuMzY0NDU1Nyw4Ljk4MDczOTc5IEM5NS43MzEyMTA1LDguNjQwMTk3NTkgOTUuOTQ0Njg4MSw4LjE0NTkzMzggOTYuMDA0ODg4Myw3LjQ5ODgzNjk3IEw5My45NjAwODAxLDcuNDk4ODM2OTcgTDkzLjk2MDA4MDEsNS45ODQ3MjM3MSBMOTcuODQyODgzMiw1Ljk4NDcyMzcxIEw5Ny44NDI4ODMyLDEwLjk4MDQ1MzMgTDk2LjU0ODY4OTUsMTAuOTgwNDUzMyBMOTYuMzQxNDMxOSw5LjkzMjE2OTgyIEM5NS45NzkxMTk5LDEwLjM5Nzk5OTYgOTUuNTc3OTMzMiwxMC43MjM4ODA1IDk1LjEzNzg3MTgsMTAuOTA5MTQ2MSBDOTQuNjk4MDMyNiwxMS4wOTQ2MzM4IDk0LjI1MzUyODQsMTEuMTg3NDg4OCA5My44MDUwMjU2LDExLjE4NzQ4ODggQzkzLjA5NzI4NDMsMTEuMTg3NDg4OCA5Mi40NjA4NTAzLDExLjA2NDY0NDggOTEuODk1NzIzNSwxMC44MTg1MTI1IEM5MS4zMzA1OTY3LDEwLjU3MjYwMjQgOTAuODUzODgyMSwxMC4yMzQyODE2IDkwLjQ2NTgwMTcsOS44MDI2NjE2IEM5MC4wNzc0OTkyLDkuMzcxMjYzNzIgODkuNzc5ODMwMiw4Ljg2NDMzNzg5IDg5LjU3MjU3MjYsOC4yODE4ODQxMSBDODkuMzY1NzU5Myw3LjY5OTQzMDMzIDg5LjI2MjI0MTYsNy4wNzE4ODE5MSA4OS4yNjIyNDE2LDYuMzk4Nzk0NTkgQzg5LjI2MjI0MTYsNS43MDg2MDI0MSA4OS4zNjU3NTkzLDUuMDY4MTY5ODIgODkuNTcyNTcyNiw0LjQ3NjgzMDQgQzg5Ljc3OTgzMDIsMy44ODU5MzUyNiA5MC4wNzc0OTkyLDMuMzcwMTIzNzkgOTAuNDY1ODAxNywyLjkzMDI4NDU1IEM5MC44NTM4ODIxLDIuNDkwMjIzMTYgOTEuMzMwNTk2NywyLjE0NTIzODE0IDkxLjg5NTcyMzUsMS44OTQ4ODUyIEM5Mi40NjA4NTAzLDEuNjQ0NzU0NCA5My4wOTcyODQzLDEuNTE5NDY2ODYgOTMuODA1MDI1NiwxLjUxOTQ2Njg2IFogTTEyOS4zNzAxODIsMS41MTk2NDQ1NyBDMTI5Ljg3OTEwNywxLjUxOTY0NDU3IDEzMC4zNjAwNDMsMS41OTI5NTExMSAxMzAuODEzMjEsMS43Mzk1NjQxOSBDMTMxLjI2NjE1NiwxLjg4NjM5OTQyIDEzMS42NzE1NjMsMi4wOTk4NzY5NSAxMzIuMDI5NjU1LDIuMzgwMjE4OTMgQzEzMi4zODc1MjQsMi42NjA1NjA5MSAxMzIuNjgzMTk0LDMuMDA3NzY3MzQgMTMyLjkxNjQ0MiwzLjQyMjI4MjUgQzEzMy4xNDkyNDUsMy44MzYxMzEyNCAxMzMuMjk1ODU5LDQuMzEwODQ2NjIgMTMzLjM1NjI4MSw0Ljg0NTc2MjIyIEwxMzEuMzg5LDQuODQ1NzYyMjIgQzEzMS4zNTQ1NjgsNC42MTI3MzYyOCAxMzEuMjc2ODE5LDQuMzk5MjU4NzUgMTMxLjE1NTk3NCw0LjIwNTEwNzQ5IEMxMzEuMDM1MTI5LDQuMDEwOTU2MjMgMTMwLjg4NDA3MywzLjg0MDc5NjIgMTMwLjcwMzI1MSwzLjY5MzczODg0IEMxMzAuNTIxOTgzLDMuNTQ3MTI1NzYgMTMwLjMxNjk0NywzLjQzMjk0NTI3IDEzMC4wODgxNDIsMy4zNTA5NzUyMyBDMTI5Ljg1OTU1OSwzLjI2OTAwNTE5IDEyOS42MjAzMTMsMy4yMjc5MDkxIDEyOS4zNzAxODIsMy4yMjc5MDkxIEMxMjguOTEyNTcyLDMuMjI3OTA5MSAxMjguNTI0MjY5LDMuMzE2NTQzMzcgMTI4LjIwNTI3NSwzLjQ5MzE0NTQ5IEMxMjcuODg1ODM2LDMuNjcwMTkxODkgMTI3LjYyNzA0MiwzLjkwNzQzODUxIDEyNy40Mjg4OTIsNC4yMDUxMDc0OSBDMTI3LjIzMDA3Niw0LjUwMjc3NjQ3IDEyNy4wODU2ODQsNC44NDEzMTk0IDEyNi45OTUyNzIsNS4yMjA5NTg0MiBDMTI2LjkwNDQxNyw1LjYwMDgxOTU4IDEyNi44NTkxLDUuOTkzMzQyNzggMTI2Ljg1OTEsNi4zOTg3NTAxNiBDMTI2Ljg1OTEsNi43ODcwNTI2OSAxMjYuOTA0NDE3LDcuMTY0NjkyNDQgMTI2Ljk5NTI3Miw3LjUzMTIyNTE0IEMxMjcuMDg1Njg0LDcuODk4MjAyMTIgMTI3LjIzMDA3Niw4LjIyODA4MTU1IDEyNy40Mjg4OTIsOC41MjEzMDc3MSBDMTI3LjYyNzA0Miw4LjgxNDc1NjAxIDEyNy44ODU4MzYsOS4wNTAwMDMzNiAxMjguMjA1Mjc1LDkuMjI2NjA1NDggQzEyOC41MjQyNjksOS40MDM2NTE4OCAxMjguOTEyNTcyLDkuNDkxODQxODcgMTI5LjM3MDE4Miw5LjQ5MTg0MTg3IEMxMjkuOTkxMjg5LDkuNDkxODQxODcgMTMwLjQ3NjQ0NSw5LjMwMjM1NTU3IDEzMC44MjYwOTUsOC45MjI0OTQ0MSBDMTMxLjE3NTUyMiw4LjU0MzA3NzUzIDEzMS4zODksOC4wNDIzNzE2NSAxMzEuNDY2NTI3LDcuNDIxMjY1MzMgTDEzMy40MzQwMyw3LjQyMTI2NTMzIEMxMzMuMzgyMDQ5LDcuOTk5NDk4NDMgMTMzLjI0ODMyLDguNTIxMzA3NzEgMTMzLjAzMjYyMSw4Ljk4NzM1OTU5IEMxMzIuODE3MTQ1LDkuNDUzMTg5MzMgMTMyLjUzMjEzOCw5Ljg1MDE1NTM1IDEzMi4xNzg0ODksMTAuMTc4MDM1NSBDMTMxLjgyNDYxOCwxMC41MDU5MTU3IDEzMS40MTA1NDgsMTAuNzU2MjY4NiAxMzAuOTM2MDU0LDEwLjkyODY1MDEgQzEzMC40NjEzMzksMTEuMTAxMDMxNSAxMjkuOTM5MzA4LDExLjE4NzQ0NDQgMTI5LjM3MDE4MiwxMS4xODc0NDQ0IEMxMjguNjYyNDQxLDExLjE4NzQ0NDQgMTI4LjAyNjAwNywxMS4wNjQ2MDA0IDEyNy40NjA4OCwxMC44MTg0NjgxIEMxMjYuODk1NzUzLDEwLjU3Mjc4MDEgMTI2LjQxOTI2MSwxMC4yMzQyMzcyIDEyNi4wMzA5NTgsOS44MDI2MTcxNyBDMTI1LjY0MjY1Niw5LjM3MTIxOTI5IDEyNS4zNDQ5ODcsOC44NjQyOTM0NiAxMjUuMTM3NzI5LDguMjgxODM5NjggQzEyNC45MzA5MTYsNy42OTkzODU5IDEyNC44MjczOTgsNy4wNzE4Mzc0OSAxMjQuODI3Mzk4LDYuMzk4NzUwMTYgQzEyNC44MjczOTgsNS43MDg1NTc5OCAxMjQuOTMwOTE2LDUuMDY4MTI1MzkgMTI1LjEzNzcyOSw0LjQ3Njc4NTk3IEMxMjUuMzQ0OTg3LDMuODg1ODkwODMgMTI1LjY0MjY1NiwzLjM3MDMwMTUgMTI2LjAzMDk1OCwyLjkzMDI0MDEyIEMxMjYuNDE5MjYxLDIuNDkwMTc4NzQgMTI2Ljg5NTc1MywyLjE0NTQxNTg2IDEyNy40NjA4OCwxLjg5NDg0MDc3IEMxMjguMDI2MDA3LDEuNjQ0OTMyMTIgMTI4LjY2MjQ0MSwxLjUxOTY0NDU3IDEyOS4zNzAxODIsMS41MTk2NDQ1NyBaIE01OC42NjY5MzUyLDEuNzM5NTE5NzcgTDU4LjY2NjkzNTIsMy40NDgwMDY0MyBMNTMuNzg3ODI5NiwzLjQ0ODAwNjQzIEw1My43ODc4Mjk2LDUuNDI4MTcxNTcgTDU4LjI2NTc0ODUsNS40MjgxNzE1NyBMNTguMjY1NzQ4NSw3LjAwNzE1MDAyIEw1My43ODc4Mjk2LDcuMDA3MTUwMDIgTDUzLjc4NzgyOTYsOS4yNzIwOTk5NiBMNTguNzcwNDUyOSw5LjI3MjA5OTk2IEw1OC43NzA0NTI5LDEwLjk4MDM2NDUgTDUxLjc1NTkwNTYsMTAuOTgwMzY0NSBMNTEuNzU1OTA1NiwxLjczOTUxOTc3IEw1OC42NjY5MzUyLDEuNzM5NTE5NzcgWiBNMTIuMjk1MjgzOSwxLjczOTYzMDg0IEwxMi4yOTUyODM5LDEwLjk4MDQ3NTYgTDEwLjI2MzEzNzcsMTAuOTgwNDc1NiBMMTAuMjYzMTM3NywxLjczOTYzMDg0IEwxMi4yOTUyODM5LDEuNzM5NjMwODQgWiBNMzEuMTEyNzgzOSwxLjczOTUxOTc3IEwzMS4xMTI3ODM5LDUuMjg1Nzc5MTcgTDM0Ljg1MzE5NDYsNS4yODU3NzkxNyBMMzQuODUzMTk0NiwxLjczOTUxOTc3IEwzNi44ODUxMTg2LDEuNzM5NTE5NzcgTDM2Ljg4NTExODYsMTAuOTgwMzY0NSBMMzQuODUzMTk0NiwxMC45ODAzNjQ1IEwzNC44NTMxOTQ2LDYuOTk0MjY1ODQgTDMxLjExMjc4MzksNi45OTQyNjU4NCBMMzEuMTEyNzgzOSwxMC45ODAzNjQ1IEwyOS4wODEwODIxLDEwLjk4MDM2NDUgTDI5LjA4MTA4MjEsMS43Mzk1MTk3NyBMMzEuMTEyNzgzOSwxLjczOTUxOTc3IFogTTQ4LjEwNjEyODUsMS43Mzk1MTk3NyBMNDguMTA2MTI4NSwzLjQ0ODAwNjQzIEw0NS4zMzY0NzQxLDMuNDQ4MDA2NDMgTDQ1LjMzNjQ3NDEsMTAuOTgwMzY0NSBMNDMuMzA0NTUwMSwxMC45ODAzNjQ1IEw0My4zMDQ1NTAxLDMuNDQ4MDA2NDMgTDQwLjUzNDg5NTcsMy40NDgwMDY0MyBMNDAuNTM0ODk1NywxLjczOTUxOTc3IEw0OC4xMDYxMjg1LDEuNzM5NTE5NzcgWiBNMi4wMzE5MjQsMS43Mzk1NjQxOSBMMi4wMzE5MjQsOS4yNzE5MjIyNSBMNi41MzU4MzMzOSw5LjI3MTkyMjI1IEw2LjUzNTgzMzM5LDEwLjk4MDQwODkgTDAsMTAuOTgwNDA4OSBMMCwxLjczOTU2NDE5IEwyLjAzMTkyNCwxLjczOTU2NDE5IFogTTY0Ljc2MjcwNzIsMS43Mzk1MTk3NyBMNjQuNzYyNzA3Miw5LjI3MjA5OTk2IEw2OS4yNjY2MTY2LDkuMjcyMDk5OTYgTDY5LjI2NjYxNjYsMTAuOTgwMzY0NSBMNjIuNzMwNzgzMiwxMC45ODAzNjQ1IEw2Mi43MzA3ODMyLDEuNzM5NTE5NzcgTDY0Ljc2MjcwNzIsMS43Mzk1MTk3NyBaIE03NS4wMjU4NjcyLDEuNzM5NTE5NzcgTDc1LjAyNTg2NzIsOS4yNzIwOTk5NiBMNzkuNTI5NTU0NCw5LjI3MjA5OTk2IEw3OS41Mjk1NTQ0LDEwLjk4MDM2NDUgTDcyLjk5Mzk0MzEsMTAuOTgwMzY0NSBMNzIuOTkzOTQzMSwxLjczOTUxOTc3IEw3NS4wMjU4NjcyLDEuNzM5NTE5NzcgWiBNODUuMjg4ODI3MiwxLjczOTYzMDg0IEw4NS4yODg4MjcyLDEwLjk4MDQ3NTYgTDgzLjI1NjkwMzIsMTAuOTgwNDc1NiBMODMuMjU2OTAzMiwxLjczOTYzMDg0IEw4NS4yODg4MjcyLDEuNzM5NjMwODQgWiBNMTA4Ljk4NTg5OSwxLjczOTUxOTc3IEwxMDguOTg1ODk5LDMuNDQ4MDA2NDMgTDEwNC4xMDY3OTQsMy40NDgwMDY0MyBMMTA0LjEwNjc5NCw1LjQyODE3MTU3IEwxMDguNTg0NzEzLDUuNDI4MTcxNTcgTDEwOC41ODQ3MTMsNy4wMDcxNTAwMiBMMTA0LjEwNjc5NCw3LjAwNzE1MDAyIEwxMDQuMTA2Nzk0LDkuMjcyMDk5OTYgTDEwOS4wODk0MTcsOS4yNzIwOTk5NiBMMTA5LjA4OTQxNywxMC45ODAzNjQ1IEwxMDIuMDc0ODcsMTAuOTgwMzY0NSBMMTAyLjA3NDg3LDEuNzM5NTE5NzcgTDEwOC45ODU4OTksMS43Mzk1MTk3NyBaIE0xMTUuMDY4OTY1LDEuNzM5NTE5NzcgTDExOC45MjU1NTUsNy45MzkwMzE2NCBMMTE4Ljk1MTc2OCw3LjkzOTAzMTY0IEwxMTguOTUxNzY4LDEuNzM5NTE5NzcgTDEyMC44NTQxODQsMS43Mzk1MTk3NyBMMTIwLjg1NDE4NCwxMC45ODAzNjQ1IEwxMTguODIyMjYsMTAuOTgwMzY0NSBMMTE0Ljk3ODMzMSw0Ljc5Mzk1ODkzIEwxMTQuOTUyNTYzLDQuNzkzOTU4OTMgTDExNC45NTI1NjMsMTAuOTgwMzY0NSBMMTEzLjA0OTkyNSwxMC45ODAzNjQ1IEwxMTMuMDQ5OTI1LDEuNzM5NTE5NzcgTDExNS4wNjg5NjUsMS43Mzk1MTk3NyBaIE0xNDQuMzE4NDc0LDEuNzM5NTE5NzcgTDE0NC4zMTg0NzQsMy40NDgwMDY0MyBMMTM5LjQzOTE0NywzLjQ0ODAwNjQzIEwxMzkuNDM5MTQ3LDUuNDI4MTcxNTcgTDE0My45MTcwNjUsNS40MjgxNzE1NyBMMTQzLjkxNzA2NSw3LjAwNzE1MDAyIEwxMzkuNDM5MTQ3LDcuMDA3MTUwMDIgTDEzOS40MzkxNDcsOS4yNzIwOTk5NiBMMTQ0LjQyMTk5Miw5LjI3MjA5OTk2IEwxNDQuNDIxOTkyLDEwLjk4MDM2NDUgTDEzNy40MDc0NDUsMTAuOTgwMzY0NSBMMTM3LjQwNzQ0NSwxLjczOTUxOTc3IEwxNDQuMzE4NDc0LDEuNzM5NTE5NzcgWiBNMTQ5LjgwMDUzNywwLjIyMjIyOTg4NyBDMTUwLjQwNDk4MywwLjIyMjIyOTg4NyAxNTAuOTIxNDYxLDAuNDM2MzczODQgMTUxLjM0OTc0OSwwLjg2NDQzOTYwNSBDMTUxLjc3ODAzNywxLjI5MjcyNzUxIDE1MS45OTIxODEsMS44MDkyMDU0MSAxNTEuOTkyMTgxLDIuNDEzODczMjkgQzE1MS45OTIxODEsMy4wMzY1MzQ2IDE1MS43NzI5MjcsMy41NjA3ODc0MyAxNTEuMzM0ODY1LDMuOTg3MDc2MDcgQzE1MC45MDg1NzcsNC4zOTkzNjk4MiAxNTAuMzk2OTg2LDQuNjA1NzM4ODQgMTQ5LjgwMDUzNyw0LjYwNTczODg0IEMxNDkuMTgzNjUyLDQuNjA1NzM4ODQgMTQ4LjY2NDI4Niw0LjM5NDQ4MjcyIDE0OC4yNDE5OTYsMy45NzIxOTI2MiBDMTQ3LjgxOTcwNiwzLjU0OTkwMjUyIDE0Ny42MDg0NSwzLjAzMDUzNjc5IDE0Ny42MDg0NSwyLjQxMzg3MzI5IEMxNDcuNjA4NDUsMS43NzM0NDA3IDE0Ny44MzY1ODgsMS4yNDExOTA3OSAxNDguMjkyNDIyLDAuODE2OTAxNDI1IEMxNDguNzIwNzEsMC40MjAzNzk2ODYgMTQ5LjIyMzQxNSwwLjIyMjIyOTg4NyAxNDkuODAwNTM3LDAuMjIyMjI5ODg3IFogTTE0OS44MDA1MzcsMC41OTY3NTk2NjQgQzE0OS4yOTY3MjEsMC41OTY3NTk2NjQgMTQ4Ljg2NzU0NSwwLjc3OTM1OTU5MSAxNDguNTEyNzg2LDEuMTQ0MTE1MTYgQzE0OC4xNjM1OCwxLjUwMDg3MzY2IDE0Ny45ODkxOTksMS45MjQyNzQ0NiAxNDcuOTg5MTk5LDIuNDEzODczMjkgQzE0Ny45ODkxOTksMi45MjE0NjU1NSAxNDguMTY2NjksMy4zNTI2NDEyOSAxNDguNTIxNjcxLDMuNzA3NjIyNjUgQzE0OC44NzQ0MzEsNC4wNjIzODE4OCAxNDkuMzAwNzIsNC4yMzk4NzI1NiAxNDkuODAwNTM3LDQuMjM5ODcyNTYgQzE1MC4yOTgxMzMsNC4yMzk4NzI1NiAxNTAuNzIzMzExLDQuMDYxMjcxMTcgMTUxLjA3NjI5MywzLjcwNDUxMjY4IEMxNTEuNDI5MDUzLDMuMzQ1NzU0OTEgMTUxLjYwNTQzMywyLjkxNTQ2Nzc0IDE1MS42MDU0MzMsMi40MTM4NzMyOSBDMTUxLjYwNTQzMywxLjkyNjI3MzczIDE1MS40Mjk5NDIsMS41MDI4NzI5MyAxNTEuMDc4OTU5LDEuMTQ0MTE1MTYgQzE1MC43MjQyLDAuNzc5MzU5NTkxIDE1MC4yOTgxMzMsMC41OTY3NTk2NjQgMTQ5LjgwMDUzNywwLjU5Njc1OTY2NCBaIE0xNDkuNTE2MTk3LDEuMjA0OTgxOCBDMTQ5LjgxNjc1NCwxLjIwNjA5MjUxIDE0OS45ODM4MDQsMS4yMDc0MjUzNiAxNTAuMDE3MzQ3LDEuMjA5NDI0NjMgQzE1MC4yMDk3MjEsMS4yMjM0MTk1MSAxNTAuMzY5NDQsMS4yNjQ5NTk4OCAxNTAuNDk2MDYxLDEuMzM0NDkwMDMgQzE1MC43MTIyMDQsMS40NTMzMzU0OCAxNTAuODIwMzg3LDEuNjQ2NTk4MTcgMTUwLjgyMDM4NywxLjkxNDI3ODExIEMxNTAuODIwMzg3LDIuMTE4NDI1NzIgMTUwLjc2MzI5NiwyLjI2NTkyNzM3IDE1MC42NDkzMzgsMi4zNTY1NjA5MSBDMTUwLjUzNTM4LDIuNDQ3NDE2NTkgMTUwLjM5NDk4NywyLjUwMTYxOSAxNTAuMjI4NjAzLDIuNTE5NjEyNDIgQzE1MC4zODE0MzYsMi41NTEzNzg1OSAxNTAuNDk2MDYxLDIuNTk4MjUwMzUgMTUwLjU3MzU4OCwyLjY1OTc4MzQxIEMxNTAuNzE2NDI1LDIuNzc1NTE4ODkgMTUwLjc4NzczMiwyLjk1NzAwODExIDE1MC43ODc3MzIsMy4yMDQ5MTc1IEwxNTAuNzg3NzMyLDMuNDIyMTcxNDMgQzE1MC43ODc3MzIsMy40NDU3MTgzOCAxNTAuNzg5Mjg3LDMuNDY5NDg3NDcgMTUwLjc5MjM5NywzLjQ5MzQ3ODcgQzE1MC43OTU1MDcsMy41MTcyNDc3OSAxNTAuODAxNTA1LDMuNTQxMDE2ODggMTUwLjgwOTk0NiwzLjU2NDc4NTk3IEwxNTAuODMyMTYsMy42MzMyMDU0MSBMMTUwLjIyNTcxNSwzLjYzMzIwNTQxIEMxNTAuMjA1OTQ1LDMuNTU1OTAwMzMgMTUwLjE5MjM5NCwzLjQ0Mzk0MTI1IDE1MC4xODU1MDgsMy4yOTcxMDYwMyBDMTUwLjE3ODYyMSwzLjE1MDI3MDgxIDE1MC4xNjUwNzEsMy4wNTE0MTgwNSAxNTAuMTQ1MywyLjk5OTY1OTE5IEMxNTAuMTEzNzU2LDIuOTE0NTc5MTcgMTUwLjA1NDIyMiwyLjg1NTA0NTM4IDE0OS45NjY5MjEsMi44MjEyNzk5NCBDMTQ5LjkxOTM4MywyLjgwMTUwOTM5IDE0OS44NDY5NjUsMi43ODg2MjUyMSAxNDkuNzQ5ODg5LDIuNzgyNjI3NCBMMTQ5LjYwOTk0LDIuNzczNzQxNzYgTDE0OS40NzYyMTEsMi43NzM3NDE3NiBMMTQ5LjQ3NjIxMSwzLjYzMzIwNTQxIEwxNDguODM5Nzc3LDMuNjMzMjA1NDEgTDE0OC44Mzk3NzcsMS4yMDM0MjY4MiBMMTQ5LjE5MTgyNSwxLjIwNDA1MDU5IEMxNDkuMjg4MDEzLDEuMjA0MzA2NSAxNDkuMzk2MTUyLDEuMjA0NjI2MzggMTQ5LjUxNjE5NywxLjIwNDk4MTggWiBNMTQ5LjYzMDgyMSwxLjYzMTcxNDcyIEwxNDkuNDc2MjExLDEuNjMxNzE0NzIgTDE0OS40NzYyMTEsMi4zMzY1NjgyMSBMMTQ5LjcyMzAxLDIuMzM2NTY4MjEgQzE0OS44NzE4NDUsMi4zMzY1NjgyMSAxNDkuOTg3NTgsMi4zMDY4MDEzMiAxNTAuMDcwODgzLDIuMjQ3MjY3NTIgQzE1MC4xNTQxODYsMi4xODc5NTU4NiAxNTAuMTk1OTQ4LDIuMDkxNzY4OCAxNTAuMTk1OTQ4LDEuOTU4OTI4NDYgQzE1MC4xOTU5NDgsMS44MjYwODgxMyAxNTAuMTMwNDE3LDEuNzMzODk5NiAxNDkuOTk5NTc2LDEuNjgyMzYyODggQzE0OS45MTIyNzQsMS42NDg1OTc0NCAxNDkuNzg5NjUyLDEuNjMxNzE0NzIgMTQ5LjYzMDgyMSwxLjYzMTcxNDcyIFoiID48L3BhdGg+Cjwvc3ZnPgo=" />
      </div>
      <div class="olt-Header-left-container">
         <button class="olt-ActionButton olt-ActionButton--default olt-ActionButton-icon-left olt-Icon-chevron-left">
            <div class="olt-ActionButton-label">Back</div>
         </button>
      </div>
      <div class="olt-Header-body">
         <div class="olt-Tabs">
            <a class="olt-Tabs-link is-active">Details</a>
            <a class="olt-Tabs-link">Permissions</a>
            <a class="olt-Tabs-link">Redirects</a>
            <a class="olt-Tabs-link">Tenants</a>
         </div>
      </div>
      <div class="olt-Header-right-container">
         <button class="olt-ActionButton olt-ActionButton--default olt-ActionButton-icon-right olt-Icon-locked">
            <div class="olt-ActionButton-label">Logout</div>
         </button>
      </div>
      <div class="olt-Header-mobile-menu">
         <button class="olt-ActionButton olt-ActionButton--default olt-ActionButton-icon-left olt-ActionButton--standalone olt-ActionButton--base olt-Icon-menu" data-action="open">
         </button>
      </div>
   </header>
   <aside class="olt-Sidebar" id="sidebar">
    <div class="olt-Sidebar-top">
      <div class="olt-Sidebar-mobile-actions">
         <button class="olt-ActionButton olt-ActionButton--default olt-ActionButton-icon-left olt-ActionButton--standalone olt-ActionButton--base olt-Icon-close" data-action="close">
         </button>
      </div>
      <button class="olt-Sidebar-selector olt-Sidebar-selector--filter" data-item="filter">
        <div class="olt-Sidebar-selector--filter-title">Filter</div>
        <div class="olt-Sidebar-selector--filter-filters">
          <div class="olt-Sidebar-selector--filter-filters-filter olt-Icon-office">
            Forschungszentrum
          </div>
          <div class="olt-Sidebar-selector--filter-filters-filter olt-Icon-floorplan">
            2nd Floor
          </div>
        </div>
      </button>
      <hr class="olt-Sidebar-separator" />
      <nav class="olt-Sidebar-navigation">
        <a href="#" class="olt-Sidebar-navigation-item olt-Icon-home" data-item="home">Home</a>
        <a href="#" class="olt-Sidebar-navigation-item olt-Icon-sensor is-active" data-item="devices">Devices</a>
        <nav class="olt-Sidebar-subnavigation">
          <a href="#" class="olt-Sidebar-subnavigation-item is-active">Devices</a>
          <a href="#" class="olt-Sidebar-subnavigation-item">Types</a>
        </nav>
        <a href="#" class="olt-Sidebar-navigation-item olt-Icon-app" data-item="applications">Applications</a>
        <a href="#" class="olt-Sidebar-navigation-item olt-Icon-code" data-item="developer">Developer Area</a>
        <a href="#" class="olt-Sidebar-navigation-item olt-Icon-user-default" data-item="team">Team</a>
      </nav>
    </div>
    <div class="olt-Sidebar-bottom">
      <button class="olt-Sidebar-selector olt-Sidebar-selector--property" data-item="property">
        <div class="olt-Sidebar-selector--property-title">Property Name</div>
        <div class="olt-Sidebar-selector--property-value">Location, Country</div>
      </button>
      <button class="olt-Sidebar-selector olt-Sidebar-selector--tenant" data-item="tenant">
        <div class="olt-Sidebar-selector--tenant-avatar">T</div>
        <div class="olt-Sidebar-selector--tenant-name">Tenant Name</div>
      </button>
    </div>
  </aside>
  <aside class="olt-Sidebar--secondary" data-name="tenant">
    <div class="olt-Sidebar--secondary-mobile-menu">
       <button class="olt-ActionButton olt-ActionButton--default olt-ActionButton-icon-left olt-ActionButton--standalone olt-ActionButton--base olt-Icon-chevron-left" data-action="back">
       </button>
       <button class="olt-ActionButton olt-ActionButton--default olt-ActionButton-icon-left olt-ActionButton--standalone olt-ActionButton--base olt-Icon-close" data-action="close">
       </button>
    </div>
    <div class="olt-Sidebar--secondary-header">
       Tenants
    </div>
  </aside>
  <aside class="olt-Sidebar--secondary" data-name="property">
    <div class="olt-Sidebar--secondary-mobile-menu">
       <button class="olt-ActionButton olt-ActionButton--default olt-ActionButton-icon-left olt-ActionButton--standalone olt-ActionButton--base olt-Icon-chevron-left" data-action="back">
       </button>
       <button class="olt-ActionButton olt-ActionButton--default olt-ActionButton-icon-left olt-ActionButton--standalone olt-ActionButton--base olt-Icon-close" data-action="close">
       </button>
    </div>
    <div class="olt-Sidebar--secondary-header">
       Property
    </div>
  </aside>
   <div class="olt-Layout-overlay"></div>
   <div class="olt-Layout-body">
      <div class="olt-Grid">
        <div class="olt-Grid-item olt-Grid-item--6">
          <div class="olt-Card">
            <div class="olt-Card-header">
              <h4 class="olt-Card-title">
                Devices
              </h4>
              <div class="olt-Card-description">
                Overview of added Devices
              </div>
            </div>
            <div class="olt-Card-content">
              This is column 1
              <br /><br /><br /><br /><br /><br />
              <br /><br /><br /><br /><br /><br />
            </div>
          </div>
        </div>
        <div class="olt-Grid-item olt-Grid-item--6">
          <div class="olt-Card">
            <div class="olt-Card-header">
              <h4 class="olt-Card-title">
                Layers
              </h4>
              <div class="olt-Card-description">
                Current 0 values
              </div>
            </div>
            <div class="olt-Card-content">
              This is column 2
              <br /><br /><br /><br /><br /><br />
              <br /><br /><br /><br /><br /><br />
            </div>
          </div>
        </div>
        <div class="olt-Grid-item olt-Grid-item--6">
          <div class="olt-Card">
            <div class="olt-Card-header">
              <h4 class="olt-Card-title">
                The connector
              </h4>
              <div class="olt-Card-description">
                Additional information
              </div>
            </div>
            <div class="olt-Card-content">
              This is column 3
              <br /><br /><br /><br /><br /><br />
              <br /><br /><br /><br /><br /><br />
              <br /><br /><br /><br /><br /><br />
            </div>
          </div>
        </div>
        <div class="olt-Grid-item olt-Grid-item--6">
          <div class="olt-Card">
            <div class="olt-Card-header">
              <h4 class="olt-Card-title">
                Contact
              </h4>
              <div class="olt-Card-description">
                Maintenance
              </div>
            </div>
            <div class="olt-Card-content">
              This is column 4
              <br /><br /><br /><br /><br /><br />
              <br /><br /><br /><br /><br /><br />
              <br /><br /><br /><br /><br /><br />
            </div>
          </div>
        </div>
        <div class="olt-Grid-item olt-Grid-item--6">
          <div class="olt-Card">
            <div class="olt-Card-header">
              <h4 class="olt-Card-title">
                Devices
              </h4>
              <div class="olt-Card-description">
                Overview of added Devices
              </div>
            </div>
            <div class="olt-Card-content">
              This is column 1
              <br /><br /><br /><br /><br /><br />
              <br /><br /><br /><br /><br /><br />
            </div>
          </div>
        </div>
        <div class="olt-Grid-item olt-Grid-item--6">
          <div class="olt-Card">
            <div class="olt-Card-header">
              <h4 class="olt-Card-title">
                Layers
              </h4>
              <div class="olt-Card-description">
                Current 0 values
              </div>
            </div>
            <div class="olt-Card-content">
              This is column 2
              <br /><br /><br /><br /><br /><br />
              <br /><br /><br /><br /><br /><br />
            </div>
          </div>
        </div>
      </div>
   </div>
</div>
```
