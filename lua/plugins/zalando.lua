return {
    {
        "diego-roccia_zse/zalando.nvim",
        dev = true,
        enabled = ((os.date("*t").wday > 1) and (os.date("*t").wday < 7)),
        config = {
            organization = "zalando-build",
            topic = "linus"
        },
    }
}
