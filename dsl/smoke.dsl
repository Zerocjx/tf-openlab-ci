def ciUrl =  'https://github.com/zerocjx/tf-openlab-ci.git'
def vrouterUrl = 'https://github.com/Juniper/contrail-vrouter.git'

pipelineJob('smoke_intel_testbed') {
    scm {
      git {
        remote {
          url(vrouterUrl)
          name("origin")
        }
        branch("*/R5.0")
      }
    }

    triggers {
        githubPush()
    }
    
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url(vrouterUrl)
                        name("origin")
                    }
                    branch("*/R5.0")
                    extensions { }
                }
            }
            scriptPath("./pipeline/intel_testbed.jenkinsfile")
        }
    }
}

listView('smoke_jobs') {
    columns {
        weather()
        status()
        name()
        lastFailure()
        lastSuccess()
        lastDuration()
        progressBar()
        nextPossibleLaunch()
    }

    jobs {
        name('smoke_intel_testbed')
    }
}
