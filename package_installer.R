# package installer

source("https://raw.githubusercontent.com/prestevez/package-checker/master/package_checker.R")

if(!is.null(not))
{
    cat(paste0("CRAN packages not installed: ", not,
               "\nInstalling... ", not, "\n"))


    ## Install all available on CRAN

    install.packages(not,
        repos = "https://cloud.r-project.org/")

}

# Check and install glmmADMB

if(admb_required){
    cat("glmmADMB required\n")
    if(!admb_test){
        cat("glmmADMB not installed. \nInstalling from source...\n")
        install.packages("glmmADMB",
            repos=c("http://glmmadmb.r-forge.r-project.org/repos",
                    getOption("repos")),
            type="source")
    }
}

# Check and install victim

if(victim_required){
    cat("victim required\n")
    if(!victim_test){
        cat("victim not installed. \nInstalling from Github...\n")
        devtools::install_github("prestevez/victim")
    }
}

# All packages should now be installed

source("https://raw.githubusercontent.com/prestevez/package-checker/master/package_checker.R")
