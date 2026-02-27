@echo off
setlocal
cd /d %~dp0

echo === [1] Gerando HTML ===
call make.bat html

call build\html\index.html


echo.
echo === [2] Gerando LaTeX (.tex) ===
sphinx-build -b latex source build/latex

echo.
echo === [3] Gerando PDF com pdflatex ===
if exist build\latex\estruturasorganizacionais.tex (
    cd build\latex
    echo Executando pdflatex 3x...
    pdflatex estruturasorganizacionais.tex
    pdflatex estruturasorganizacionais.tex
    pdflatex estruturasorganizacionais.tex
    echo PDF gerado com sucesso!
    start estruturasorganizacionais.pdf
    cd ../..
) else (
    echo ERRO: Arquivo estruturasorganizacionais.tex NAO encontrado!
)

echo.
echo === Processo concluído ===
pause
endlocal
