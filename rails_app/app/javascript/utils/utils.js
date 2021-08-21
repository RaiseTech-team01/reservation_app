/*
 * getAgeImprのラッパー関数
 * birthday: "YYYYMMDD"
 */
export function getAge(birthday) {
  if (!birthday.match(/^[12][0-9]{7}$/)) {
    console.log("getAge", "不正な入力文字列です")
  }
  let year = birthday.substr(0, 4)
  let month = birthday.substr(4, 2)
  let date = birthday.substr(6, 2)
  ;[year, month, date] = [year, month, date].map((b) => parseInt(b))
  return getAgeImpr({
    year,
    month,
    date,
  })
}

/*
 * 生年月日から年齢を計算する
 * birthday: { year: 生年月日の年[YYYY], month: 同月[MM], date: 同日[DD] }
 *   YYYY, MM, DD は整数値
 */
function getAgeImpr(birthday) {
  console.log(birthday)
  var today = new Date()

  var thisYearsBirthday = new Date(
    today.getFullYear(),
    birthday.month - 1,
    birthday.date
  )

  var age = today.getFullYear() - birthday.year

  if (today < thisYearsBirthday) {
    age--
  }
  console.log(age)
  return age
}
