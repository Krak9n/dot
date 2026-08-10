use std::{
    io, fs, collections::HashMap,
};

// my approach is during a constructor to create a hashmap of all files present
// then just print everything up in one go

struct RS {
    files: Vec<String>,
    filesizes: Box<[u32]>,
    creation_dates: Vec<String>,
}

impl RS {
    pub fn new() -> Self {
        let mut entries = fs::read_dir("./").unwrap()
            .map(|res| res.map(|e| e.path()))
            .collect::<Result<Vec<_>, io::Error>>().unwrap();

        Self {
            files: {
                let mut val_files: Vec<String> = vec![];
                let mut temp = entries
                    .iter()
                    .filter_map(|(key, value)| {
                        val_files.push(value);
                    });
                println!("{:?}", val_files);
                val_files
                    
            },
            filesizes: {
                let val: Box<[u32]> = Box::default();
                val
            },
            creation_dates: {
                let val: Vec<String> = vec![];
                val
            },
        }
    }
/*
    pub fn print(self) -> Result<(), Box<dyn std::error::Error>> {
        for entry in fs::read_dir(&path)? {
            let path2 = entry?.path();
            let path_str = path2.to_str().unwrap();

            let pb = PathBuf::from(path2.clone());
            let is_file = path2.is_file();

            if is_file == true {
                let _ = print!("{}: ", &path2.display().to_string());
                // " --> ", /*"--is file"*/
            }

            if is_file == false {
                let _ = print!("{}: ", &path2.display().to_string());
                // " --> ", /*"--is dir"*/
            }

            match Self::filesize(&path_str) {
                Ok(x) => print!("{} bytes", x),
                Err(e) => print!("Error: {}", e),
            }

            let _ = Self::creation_date(path_str);
        }
        Ok(())
    }*/
}

fn main() {
    let access = RS::new();

    //RS::printing(access.files);
}
