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

type SorteadorApp struct {
  entrada *widget.Entry
  resultado *canvas.Text
}

func (s *SorteadorApp) sortear() {
  linhas := strings.Split(s.entrada.Text, "\n")
  var palavras []string

  for _, l := range linhas {
    if strings.TrimSpace(l) != "" {
      palavras = append(palavras, strings.TrimSpace(l))
    }
  }

  if len(palavras) > 0 {
    rand.Seed(time.Now().UnixNano())
    escolha := palavras[rand.Intn(len(palavras))]

    s.resultado.Text = escolha
    s.resultado.Color = color.NRGBA{R: 100, G: 255, B: 100, A: 255}

  } else {
    s.resultado.Text = "Digite algo!"
  }
  s.resultado.Refresh()
}

func main(){
  a := app.New()
  w := a.NewWindow("Sorteador")
  w.Resize(fyne.NewSize(800,100))

  meuApp := &SorteadorApp{
    entrada: widget.NewMultiLineEntry(),
    resultado: canvas.NewText("Esperando sorteio", color.White),
  }

  meuApp.resultado.TextSize = 26
  meuApp.resultado.Alignment = fyne.TextAlignCenter
  meuApp.resultado.TextStyle = fyne.TextStyle{Bold: true}

  meuApp.entrada.SetPlaceHolder("Digite aqui as atividades.")

  botaoSortear := widget.NewButton("Sortear", meuApp.sortear)

  controles := container.NewVBox(meuApp.resultado, botaoSortear)
  layoutFinal := container.NewBorder(nil, controles, nil, nil, meuApp.entrada)

  w.SetContent(layoutFinal)

  w.ShowAndRun()
}
