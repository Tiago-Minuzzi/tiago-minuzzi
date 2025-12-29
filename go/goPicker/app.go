package main

import (
  "time"
  "math/rand"
  "strings"
  "image/color"

  "fyne.io/fyne/v2"
  "fyne.io/fyne/v2/app"
  "fyne.io/fyne/v2/canvas"
  "fyne.io/fyne/v2/container"
  "fyne.io/fyne/v2/widget"
)

func main(){
  a := app.New()
  w := a.NewWindow("Janela")
  w.Resize(fyne.NewSize(800,100))

  entrada := widget.NewMultiLineEntry()
  entrada.SetPlaceHolder("Digite aqui.")

  // resultado := widget.NewLabel("")
  // resultado.Alignment = fyne.TextAlignCenter
  
  resultado := canvas.NewText("Pronto para sortear", color.White)
  resultado.TextSize = 26
  resultado.Alignment = fyne.TextAlignCenter
  resultado.TextStyle = fyne.TextStyle{Bold: true}

  botaoSortear := widget.NewButton("Sortear", func() {
    linhas := strings.Split(entrada.Text, "\n")
    var palavras []string
    // palavras := splitLines(linhas)

    for _, l := range linhas {
      if strings.TrimSpace(l) != "" {
        palavras = append(palavras, strings.TrimSpace(l))
      }
    }

    if len(palavras) > 0 {
      rand.Seed(time.Now().UnixNano())
      escolha := palavras[rand.Intn(len(palavras))]

      resultado.Text = escolha
      resultado.Color = color.NRGBA{R: 100, G: 255, B: 100, A: 255}
      resultado.Refresh()
      // resultado.SetText("Resultado: " + palavras[randomIndex])
    } else {
      resultado.Text = "Digite algo!"
      resultado.Refresh()
      // resultado.SetText("Digite algumas palavras!")
    }
  })

  controles := container.NewVBox(resultado, botaoSortear)
  layoutFinal := container.NewBorder(nil, controles, nil, nil, entrada)

  w.SetContent(layoutFinal)

  w.ShowAndRun()
}
