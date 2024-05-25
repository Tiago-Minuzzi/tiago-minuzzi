use std::collections::HashMap;
use std::fs::File;
use std::io::{self, BufRead};
use std::env;

fn main() -> io::Result<()> {
    let args: Vec<String> = env::args().collect();

    // Verifique se o nome do arquivo foi fornecido
    if args.len() < 2 {
        eprintln!("Uso: {} <nome_do_arquivo>", args[0]);
        std::process::exit(1);
    }

    let file_path = &args[1];

    let file = File::open(&file_path)?;
    let file = io::BufReader::new(file);

    let mut data: HashMap<String, Vec<String>> = HashMap::new();

    for linha in file.lines() {
        let linha: String = linha.expect("Erro ao ler a linha.");
        if !linha.starts_with('@') {
            let linha: Vec<&str> = linha.split("\t").collect();
            let idx = linha[0].to_string();
            let cgr = linha[5].to_string();

            data.entry(idx).or_insert_with(Vec::new).push(cgr);
        }
    }

    for (k, v) in data {
        println!("{}\t{}",k, v.join("\t"));
    }
    Ok(())
}
