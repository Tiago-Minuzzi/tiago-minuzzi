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

func (s *SorteadorApp) limpar() {
  s.entrada.SetText("")
  s.resultado.Text = "Esperando sorteio"
  s.resultado.Color = color.White
  s.resultado.Refresh()
}

func main(){
  a := app.New()
  w := a.NewWindow("Sorteador")
  w.Resize(fyne.NewSize(400, 400))

  meuApp := &SorteadorApp{
    entrada: widget.NewMultiLineEntry(),
    resultado: canvas.NewText("Esperando sorteio", color.White),
  }

  meuApp.resultado.TextSize = 26
  meuApp.resultado.Alignment = fyne.TextAlignCenter
  meuApp.resultado.TextStyle = fyne.TextStyle{Bold: true}

  borda := canvas.NewRectangle(color.Transparent)
  borda.StrokeColor = color.White
  borda.StrokeWidth = 1
  borda.SetMinSize(fyne.NewSize(0,80))

  areaResultado := container.NewStack(borda, container.NewPadded(meuApp.resultado))

  meuApp.entrada.SetPlaceHolder("Digite aqui as atividades.")

  botaoSortear := widget.NewButton("Sortear", meuApp.sortear)
  botaoLimpar := widget.NewButton("Limpar tudo", meuApp.limpar)

  botaoSortear.Importance = widget.HighImportance

  controles := container.NewVBox(areaResultado, botaoSortear, botaoLimpar)
  layoutFinal := container.NewBorder(nil, controles, nil, nil, meuApp.entrada)

  w.SetContent(layoutFinal)

  w.ShowAndRun()
}
